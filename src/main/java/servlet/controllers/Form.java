package servlet.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.core.Controller;
import utils.Error;

@WebServlet(
        name = "Form",
        value = "/form/*"
    )
public class Form extends Controller {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String[] params = this.getUrlParameters(req, "form");

        if (params.length == 0) {
            this.Index(req, res);
            return;
        }

        switch (params[0]) {
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

        req.getRequestDispatcher("/views/form/form.jsp").forward(req, res);
    }
}