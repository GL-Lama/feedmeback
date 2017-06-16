package servlet.models;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Database;
import database.Student.Student;
import database.Teacher.Teacher;
import io.jsonwebtoken.Claims;
import servlet.core.Model;
import utils.Auth;
import utils.Cookies;

public class AuthModel extends Model {

	public String username;
	public String password;
	public Boolean isTeacher;

	public AuthModel() {}
	public AuthModel(Database db) {
		super(db);
	}

	public boolean init(Database db, String username, String password, Boolean isTeacher) {

		this.db = db;
		this.username = username;
		this.password = password;
		this.isTeacher = isTeacher;

		return true;
	}

	public void doLogin(HttpServletRequest req, HttpServletResponse res) throws IOException {

		// If the username has not been sent redirect to "/login"
		if (username == null || password == null) {
			res.sendError(400);
			return;
		}

		// if the user already has a token, redirtect to "/"
		if (Cookies.getCookieValue(req, "access_token") != null) {
			res.sendRedirect("/");
			return;
		}

		String access_token;

		// LDAPAccess access = new LDAPAccess();
		// try {
		// 	//Enter login and password Here
		//     LDAPObject ldap = access.LDAPget(username, password);

		//     if (ldap == null)
		//         System.out.println("login invalide");

		//     System.out.println(ldap.toString());

		// } catch(Exception e) {
		// 	System.err.println(e.getMessage());
		// }

		if (isTeacher) {

			// Query the Teacher
			Map<String, String> params = new HashMap<String, String>();

			params.put("username", username);

			Teacher teacher = (Teacher) this.db.selectOne("Teacher", params);

			// create his access_token
			access_token = Auth.createToken(req, username, "teacher");

			// If we haven't found the student, register him
			if (teacher == null) {
				Teacher newTeacher = new Teacher(username, password, access_token);
				this.db.insert("Teacher", newTeacher);
			}

			else {
				teacher.setAccessToken(access_token);
				this.db.update("Teacher", teacher);
			}

		}

		else {

			// Query the student
			Map<String, String> params = new HashMap<String, String>();

			params.put("username", username);

			Student student = (Student) this.db.selectOne("Student", params);

			// create his access_token
			access_token = Auth.createToken(req, username, "student");

			// If we haven't found the student, register him
			if (student == null) {
				Student newStudent = new Student(username, password, access_token);
				this.db.insert("Student", newStudent);
			}

			else {
				student.setAccessToken(access_token);
				this.db.update("Student", student);
			}

		}

		// Store the access_token in cookies
		Cookie cookie = new Cookie("access_token", access_token);
		cookie.setMaxAge(60 * 60 * 24 * 365 * 10);

		res.addCookie(cookie);

	}

	public void doLogout(HttpServletRequest req, HttpServletResponse res) throws IOException{

		// Update cookie max age
		Cookie[] cookies = req.getCookies();

		Cookie cookie_token = null;

		for (Cookie cookie: cookies) {
			if (cookie.getName().equals("access_token"))
				cookie_token = cookie;
		}

		if (cookie_token == null) {
			res.sendRedirect("/");
			return;
		}

		String access_token = cookie_token.getValue();

		Claims claims = Auth.getTokenClaims(access_token);

		String username = (String) claims.get("username");
		String scope = (String) claims.get("scope");

		if (scope.equals("student")) {

			// Query the student
			Map<String, String> params = new HashMap<String, String>();

			params.put("username", username);

			Student student = (Student) this.db.selectOne("Student", params);

			student.setAccessToken(null);

			this.db.update("Student", student);
		}

		else {

			// Query the Teacher
			Map<String, String> params = new HashMap<String, String>();

			params.put("username", username);

			Teacher teacher = (Teacher) this.db.selectOne("Teacher", params);

			teacher.setAccessToken(null);

			this.db.update("Student", teacher);
		}

		cookie_token.setMaxAge(0);

		res.addCookie(cookie_token);

		res.sendRedirect("/");
	}
}