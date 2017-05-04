package servlet.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.annotations.Check;

import servlet.core.Controller;
import utils.Error;
import utils.console;


@WebServlet(
        name = "FormManager",
        value = "/formManager/*"
    )

public class FormManager extends Controller {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String[] params = this.getUrlParameters(req, "formManager");

        if (params.length == 0 || params[0].equals("")) {
            this.Index(req, res);
            return;
        }

        switch (params[0]) {
            default:
                Error.send404(req, res);
                break;
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        this.doGet(req, res);
    }

    public void Index(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        req.getRequestDispatcher("/views/form-manager/formManager.jsp").forward(req, res);
    }
}

