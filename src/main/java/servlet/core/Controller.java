package servlet.core;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

public abstract class Controller extends HttpServlet {

    public String[] getUrlParameters(HttpServletRequest req) {

        String url = req.getPathInfo();

        if (url.charAt(0) == "/".charAt(0))
            url = url.substring(1);

        if (url == null)
            return null;

        return url.split("/");
    }

    public String getUrlParameter(HttpServletRequest req, int index) {

        return this.getUrlParameters(req)[index];
    }
}