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
import io.jsonwebtoken.Claims;
import servlet.core.Controller;
import utils.Auth;
import utils.Check;
import utils.Cookies;
import utils.Error;
import utils.console;

@WebServlet(
        name = "Dashboard",
        value = "/dashboard/*"
    )
public class Dashboard extends Controller {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String[] params = this.getUrlParameters(req, "dashboard");

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

    private void Index(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String access_token = Cookies.getCookieValue(req, "access_token");

        if (access_token == null || !Auth.validate(access_token, req, res))
            req.getRequestDispatcher("/views/home/login.jsp").forward(req, res);

        else
            req.getRequestDispatcher("/views/dashboard/dashboard.jsp").forward(req, res);

    }

}