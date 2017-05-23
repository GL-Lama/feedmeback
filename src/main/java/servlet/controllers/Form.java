package servlet.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.core.Controller;
import servlet.models.FormModel;
import utils.Auth;
import utils.Cookies;
import utils.Error;
import utils.console;

@WebServlet(
        name = "Form",
        value = "/form/*"
    )
public class Form extends Controller {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String[] params = this.getUrlParameters(req, "form/");

        if (params.length == 0 || params[0].equals("")) {
            this.Index(req, res);
            return;
        }

        switch (params[0]) {
            case "newForm":
                this.NewForm(req, res);
                return;
            case "getForms":
                this.GetForms(req, res);
                return;
            case "formQuestion":
                this.FormQuestion(req, res);
                return;
            default:
                Error.send404(req, res);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        this.doGet(req, res);
    }

    public void Index(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String idForm = req.getParameter("id");

        String access_token = Cookies.getCookieValue(req, "access_token");

        FormModel formModel = new FormModel();

        if (!formModel.init(this.db, Auth.getTokenClaim(access_token, "username"), idForm)) {
            res.sendError(400);
            return;
        }

        req.setAttribute("formModel", formModel);

        req.getRequestDispatcher("/views/form/form.jsp").forward(req, res);
    }

    public void NewForm(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        req.getRequestDispatcher("/views/form/newForm.jsp").forward(req, res);
    }

    public void FormManager(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        req.getRequestDispatcher("/views/formManager/formManager.jsp").forward(req, res);
    }

    public void FormQuestion(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        req.getRequestDispatcher("/views/form/formQuestion.jsp").forward(req, res);
    }

    public void GetForms(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        res.getWriter().println("hello");
    }
}