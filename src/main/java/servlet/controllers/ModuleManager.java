package servlet.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import database.Module.Module;
import database.Student.Student;
import servlet.core.Controller;
import servlet.models.ModuleManagerModel;
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

        if (params.length == 0 || params[0].equals("")) {
            this.Index(req, res);
            return;
        }

        switch (params[0]) {
            case "moduleConfirm":
                this.ModuleConfirm(req, res);
                break;
            case "newModule":
                this.NewModule(req, res);
                break;
            case "searchModule":
                this.SearchModule(req, res);
                break;
            case "addModule":
                this.AddModule(req, res);
                break;
            case "joinModule":
                this.JoinModule(req, res);
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

    private void ModuleConfirm(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String idModule = req.getParameter("idModule");

        String access_token = Cookies.getCookieValue(req, "access_token");

        if (access_token == null || !Auth.validate(access_token, req, res))
            req.getRequestDispatcher("/views/home/login.jsp").forward(req, res);

        ModuleManagerModel moduleManagerModel = new ModuleManagerModel();

        if (!moduleManagerModel.init(this.db, Auth.getTokenClaim(access_token, "username"))) {
            res.sendError(400);
            return;
        }

        moduleManagerModel.loadModule(idModule);
        moduleManagerModel.loadStudents(moduleManagerModel.module);

        req.setAttribute("moduleManager", moduleManagerModel);

        req.getRequestDispatcher("/views/module-manager/moduleConfirm.jsp").forward(req, res);

    }

    private void NewModule(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String access_token = Cookies.getCookieValue(req, "access_token");

        if (access_token == null || !Auth.validate(access_token, req, res))
            req.getRequestDispatcher("/views/home/login.jsp").forward(req, res);

        req.getRequestDispatcher("/views/module-manager/newModule.jsp").forward(req, res);

    }

    private void SearchModule(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String moduleName = req.getParameter("moduleName");
        String access_token = Cookies.getCookieValue(req, "access_token");

        if (access_token == null || !Auth.validate(access_token, req, res))
            req.getRequestDispatcher("/views/home/login.jsp").forward(req, res);

        ModuleManagerModel moduleManagerModel = new ModuleManagerModel();

        if (!moduleManagerModel.init(this.db, Auth.getTokenClaim(access_token, "username"))) {
            res.sendError(400);
            return;
        }

        res.setContentType("application/json");
        res.setCharacterEncoding("utf-8");
        moduleManagerModel.searchModules(moduleName);

        Gson gson = new Gson();
        String json = gson.toJson(moduleManagerModel.modules);

        PrintWriter out = res.getWriter();

        out.println(json);

        out.close();
    }

    private void AddModule(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String moduleName = req.getParameter("moduleName");
        Gson gson = new Gson();
        utils.Student[] students = gson.fromJson(req.getParameter("students"), utils.Student[].class);

        String access_token = Cookies.getCookieValue(req, "access_token");

        if (access_token == null || !Auth.validate(access_token, req, res))
            req.getRequestDispatcher("/views/home/login.jsp").forward(req, res);

        ModuleManagerModel moduleManagerModel = new ModuleManagerModel();

        if (!moduleManagerModel.init(this.db, Auth.getTokenClaim(access_token, "username"))) {
            res.sendError(400);
            return;
        }

        int idModule = moduleManagerModel.addModule(moduleName, students);

        if (idModule != 0) {
            JsonObject ret = new JsonObject();

            ret.addProperty("idModule", idModule);

            PrintWriter out = res.getWriter();
            out.println(ret);
            out.close();
        }

        else
            res.sendError(400);
    }

    private void JoinModule (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String idModule = req.getParameter("idModule");

        String access_token = Cookies.getCookieValue(req, "access_token");

        if (access_token == null || !Auth.validate(access_token, req, res))
            req.getRequestDispatcher("/views/home/login.jsp").forward(req, res);

        ModuleManagerModel moduleManagerModel = new ModuleManagerModel();

        if (!moduleManagerModel.init(this.db, Auth.getTokenClaim(access_token, "username"))) {
            res.sendError(400);
            return;
        }

        moduleManagerModel.joinModule(idModule);

    }   

}