package servlet.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.core.Controller;
import servlet.models.TeacherModel;
import utils.Auth;
import utils.Cookies;
import utils.Error;
import utils.console;

@WebServlet(
        name = "ModuleManager",
        value = "/moduleManager/*"
    )
public class ModuleManager extends Controller {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        if (req.getSession().getAttribute("theme") == null)
            req.getSession().setAttribute("theme", (int) (Math.random() * 4));

        String[] params = this.getUrlParameters(req, "moduleManager/");

        console.log(params);
        console.log(params.length);

        if (params.length == 0 || params[0].equals("")) {
            this.Index(req, res);
            return;
        }

        switch (params[0]) {
            case "newModule":
                this.NewModule(req, res);
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

        TeacherModel teacherModel = new TeacherModel();

        if (!teacherModel.init(this.db, Auth.getTokenClaim(access_token, "username"))) {
            res.sendError(400);
            return;
        }

        req.setAttribute("teacher", teacherModel);


        req.getRequestDispatcher("/views/module-manager/moduleManager.jsp").forward(req, res);

    }

    private void NewModule(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String access_token = Cookies.getCookieValue(req, "access_token");

        if (access_token == null || !Auth.validate(access_token, req, res))
            req.getRequestDispatcher("/views/home/login.jsp").forward(req, res);

        req.getRequestDispatcher("/views/module-manager/newModule.jsp").forward(req, res);

    }

}