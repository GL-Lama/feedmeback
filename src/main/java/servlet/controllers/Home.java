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
import servlet.models.AuthModel;
import servlet.models.TeacherModel;
import utils.Auth;
import utils.Check;
import utils.Cookies;
import utils.Error;

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

        if (req.getSession().getAttribute("theme") == null)
            req.getSession().setAttribute("theme", (int) (Math.random() * 4));

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

        else {
            String scope = Auth.getTokenClaim(access_token, "scope");

            if (scope.equals("teacher")) {

                TeacherModel teacherModel = new TeacherModel();

                if (!teacherModel.init(this.db, Auth.getTokenClaim(access_token, "username"))) {
                    res.sendError(400);
                    return;
                }

                req.setAttribute("teacher", teacherModel);

                req.getRequestDispatcher("/views/home/teacher.jsp").forward(req, res);
            }

            else if (scope.equals("student")) {
                req.getRequestDispatcher("/views/home/student.jsp").forward(req, res);
            }

            else {
                res.sendError(400);
            }
        }

    }

    private void Login(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        Boolean isTeacher = Boolean.parseBoolean(req.getParameter("isTeacher"));

        AuthModel authModel = new AuthModel();
        if (!authModel.init(this.db, username, password, isTeacher))
            res.sendError(400);

        authModel.doLogin(req, res);
    }

    private void Logout(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        AuthModel authModel = new AuthModel();
        if (!authModel.init(this.db))
            res.sendError(400);

        authModel.doLogout(req, res);
    }

}