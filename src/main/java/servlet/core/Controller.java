package servlet.core;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import database.Database;

public abstract class Controller extends HttpServlet {

    public Database db = new Database();

    public String[] getUrlParameters(HttpServletRequest req, String controller) {

        String url = req.getRequestURL().toString();

        String prefix = "http://" + req.getServerName();

        if (req.getServerName().equals("localhost"))
            prefix += ":" + req.getLocalPort();

        prefix += controller;

        url = url.substring(prefix.length());

        if (url == null || url.length() == 1)
            return new String[0];

        if (url.length() >= 1 && url.charAt(0) == "/".charAt(0))
            url = url.substring(1);

        return url.split("/");
    }

    public String getUrlParameter(HttpServletRequest req, String controller, int index) {

        return this.getUrlParameters(req, controller)[index];
    }
}