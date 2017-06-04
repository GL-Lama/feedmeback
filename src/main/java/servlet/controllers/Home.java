package servlet.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.core.Controller;
import servlet.models.AuthModel;
import servlet.models.StudentModel;
import servlet.models.TeacherModel;
import utils.Auth;

@WebServlet(
        name = "Home",
        value = "/"
    )
public class Home extends Controller {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        this.initGet(req, res);

        this.callMethod(this, req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        this.doGet(req, res);
    }

    public void index(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        System.out.println("Hello INDEX");

        String access_token = Auth.validate(req, res);

        if (access_token == null)
            return;

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

            StudentModel studentModel = new StudentModel();

            if (!studentModel.init(this.db, Auth.getTokenClaim(access_token, "username"))) {
                res.sendError(400);
                return;
            }

            req.setAttribute("student", studentModel);

            req.getRequestDispatcher("/views/home/student.jsp").forward(req, res);
        }

        else {
            res.sendError(400);
        }

    }

    public void login(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        Boolean isTeacher = Boolean.parseBoolean(req.getParameter("isTeacher"));

        AuthModel authModel = new AuthModel();
        if (!authModel.init(this.db, username, password, isTeacher))
            res.sendError(400);

        authModel.doLogin(req, res);
    }

    public void logout(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        AuthModel authModel = new AuthModel();
        if (!authModel.init(this.db))
            res.sendError(400);

        authModel.doLogout(req, res);
    }

}