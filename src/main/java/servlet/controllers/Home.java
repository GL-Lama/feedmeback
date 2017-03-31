package servlet.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.core.Controller;
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

        String[] params = this.getUrlParameters(req);

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

        else
            req.getRequestDispatcher("/views/home/home.jsp").forward(req, res);

    }

    private void Login(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String access_token = Auth.createToken(req);

        Cookie cookie = new Cookie("access_token", access_token);
        cookie.setMaxAge(60 * 60 * 24 * 365 * 10);

        res.addCookie(cookie);

        res.sendRedirect("/");
    }

    private void Logout(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.sendRedirect("/");
    }

}