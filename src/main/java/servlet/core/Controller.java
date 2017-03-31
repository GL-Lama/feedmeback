package servlet.core;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import database.Database;

public abstract class Controller extends HttpServlet {

    public Database db = new Database();

    public String[] getUrlParameters(HttpServletRequest req) {

        String url = req.getRequestURL().toString();

        String prefix = "http://" + req.getServerName() + ":" + req.getLocalPort();

        url = url.substring(prefix.length());

        if (url == null || url.length() == 1)
            return new String[0];

        if (url.length() >= 1 && url.charAt(0) == "/".charAt(0))
            url = url.substring(1);

        return url.split("/");
    }

    public String getUrlParameter(HttpServletRequest req, int index) {

        return this.getUrlParameters(req)[index];
    }
}