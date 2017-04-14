package servlet.models;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Database;
import database.Student;
import database.Teacher;
import servlet.core.Model;
import utils.Auth;

public class AuthModel extends Model {

    public String username;
    public String password;
    public Boolean isTeacher;

    public boolean init(Database db, String username, String password, Boolean isTeacher) {

        this.db = db;
        this.username = username;
        this.password = password;
        this.isTeacher = isTeacher;

        return true;
    }

    public void doLogin(HttpServletRequest req, HttpServletResponse res) {

        String access_token;

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

        }

        // Store the access_token in cookies
        Cookie cookie = new Cookie("access_token", access_token);
        cookie.setMaxAge(60 * 60 * 24 * 365 * 10);

        res.addCookie(cookie);

    }
}