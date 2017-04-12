package servlet.controllers;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Student;
import database.Teacher;
import io.jsonwebtoken.Claims;
import servlet.core.Controller;
import utils.Auth;
import utils.Check;
import utils.Cookies;
import utils.Error;
import utils.console;

@WebServlet(
        name = "Home",
        value = "/"
    )
public class Home extends Controller {

    private final String[][] routes = new String[][] {
        {},
        {"login"},
        {"logout"}
    };

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String[] params = this.getUrlParameters(req, "");

        if (!Check.containsRoute(this.routes, params)) {
            Error.send404(req, res);
            return;
        }

        if (params.length == 0) {
            this.Index(req, res);
            return;
        }

        switch (params[0]) {
            case "login":
                this.Login(req, res);
                break;
            case "logout":
                this.Logout(req, res);
                break;
            default:
                Error.send404(req, res);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        this.doGet(req, res);
    }

    private void Index(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String access_token = Cookies.getCookieValue(req, "access_token");

        if (access_token == null || !Auth.validate(access_token, req, res))
            req.getRequestDispatcher("/views/home/login.jsp").forward(req, res);

        else
            req.getRequestDispatcher("/views/home/home.jsp").forward(req, res);

    }

    private void Login(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        Boolean isTeacher = Boolean.parseBoolean(req.getParameter("isTeacher"));

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

    private void Logout(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        // Update cookie max age
        Cookie[] cookies = req.getCookies();

        Cookie cookie_token = null;

        for (Cookie cookie: cookies) {
            if (cookie.getName().equals("access_token"))
                cookie_token = cookie;
        }

        if (cookie_token == null)
            return;

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
            // TODO
        }

        cookie_token.setMaxAge(0);

        res.addCookie(cookie_token);
    }

}