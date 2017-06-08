package servlet.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import servlet.core.Controller;
import servlet.models.ModuleManagerModel;
import servlet.models.TeacherModel;
import utils.Auth;

@WebServlet(
        name = "ModuleManager",
        value = "/moduleManager/*"
    )
public class ModuleManager extends Controller {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        this.initGet(req, res);

        this.callMethod(this, req, res, "moduleManager/");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        this.doGet(req, res);
    }

    public void index(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String access_token = Auth.validate(req, res);

        if (access_token == null)
            return;

        TeacherModel teacherModel = new TeacherModel();

        if (!teacherModel.init(this.db, Auth.getTokenClaim(access_token, "username"))) {
            res.sendError(400);
            return;
        }

        req.setAttribute("teacher", teacherModel);

        req.getRequestDispatcher("/views/module-manager/moduleManager.jsp").forward(req, res);

    }

    public void moduleConfirm(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String access_token = Auth.validate(req, res);

        if (access_token == null)
            return;

        String idModule = req.getParameter("idModule");

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

    public void newModule(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String access_token = Auth.validate(req, res);

        if (access_token == null)
            return;

        req.getRequestDispatcher("/views/module-manager/newModule.jsp").forward(req, res);

    }

    public void searchModule(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String access_token = Auth.validate(req, res);

        if (access_token == null)
            return;

        String moduleName = req.getParameter("moduleName");

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

    public void addModule(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String access_token = Auth.validate(req, res);

        if (access_token == null)
            return;

        String moduleName = req.getParameter("moduleName");
        Gson gson = new Gson();
        utils.Student[] students = gson.fromJson(req.getParameter("students"), utils.Student[].class);

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

    public void joinModule (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String access_token = Auth.validate(req, res);

        if (access_token == null)
            return;

        String idModule = req.getParameter("idModule");

        ModuleManagerModel moduleManagerModel = new ModuleManagerModel();

        if (!moduleManagerModel.init(this.db, Auth.getTokenClaim(access_token, "username"))) {
            res.sendError(400);
            return;
        }

        moduleManagerModel.joinModule(idModule);

    }

}