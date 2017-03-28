package utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class Cookies {

    public static Cookie[] getCookies(HttpServletRequest req) {
        return req.getCookies();
    }

    public static String getCookieValue(HttpServletRequest req, String name) {
        Cookie[] cookies = Cookies.getCookies(req);

        if (cookies == null)
            return null;

        for (Cookie cookie : cookies) {
            if (cookie.getName().equalsIgnoreCase(name))
                return cookie.getValue();
        }

        return null;
    }
}