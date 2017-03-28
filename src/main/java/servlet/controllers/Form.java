package servlet.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.core.Controller;

@WebServlet(
        name = "Form",
        value = "/form/*"
    )
public class Form extends Controller {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        if (this.getUrlParameters(req).length >= 1)
            req.getRequestDispatcher("/views/error/404.jsp").forward(req, res);

        // else if (this.getUrlParameter(req, 0))

        PrintWriter out = res.getWriter();
        out.println("Form");
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        this.doGet(req, res);
    }
}