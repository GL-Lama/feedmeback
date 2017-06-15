package servlet.core;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Database;
import utils.Error;

public abstract class Controller extends HttpServlet {

    public void initGet(HttpServletRequest req, HttpServletResponse res) {

        if (req.getSession().getAttribute("theme") == null)
            req.getSession().setAttribute("theme", (int) (Math.random() * 4));

    }

    public void callMethod(Controller controller, HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        try {
            String[] params = this.getUrlParameters(req, "");

            if (params.length != 0 && params[0].equals("favicon.ico")) {
                Error.send404(req, res);
            }


            else if (params.length == 0 || params[0].equals("")) {
                Method method = controller.getClass().getMethod("index", HttpServletRequest.class, HttpServletResponse.class);
                method.invoke(controller, req, res);
            }

            else {
                Method method = controller.getClass().getMethod(params[0], HttpServletRequest.class, HttpServletResponse.class);
                method.invoke(controller, req, res);
            }
        }
        catch (SecurityException e) {
            System.out.println("SecurityException");
            e.printStackTrace();
            Error.send404(req, res);
        }
        catch (NoSuchMethodException e) {
            System.out.println("NoSuchMethodException");
            e.printStackTrace();
            Error.send404(req, res);
        }
        catch (IllegalArgumentException e) {
            System.out.println("IllegalArgumentException");
            e.printStackTrace();
            Error.send404(req, res);
        }
        catch (IllegalAccessException e) {
            System.out.println("IllegalAccessException");
            e.printStackTrace();
            Error.send404(req, res);
        }
        catch (InvocationTargetException e) {
            System.out.println("InvocationTargetException");
            e.printStackTrace();
            Error.send404(req, res);
        }

    }

    public void callMethod(Controller controller, HttpServletRequest req, HttpServletResponse res, String prefix) throws ServletException, IOException {

        try {
            String[] params = this.getUrlParameters(req, prefix);

            if (params.length == 0 || params[0].equals("")) {
                Method method = controller.getClass().getMethod("index", HttpServletRequest.class, HttpServletResponse.class);
                method.invoke(controller, req, res);
            }

            else {
                Method method = controller.getClass().getMethod(params[0], HttpServletRequest.class, HttpServletResponse.class);
                method.invoke(controller, req, res);
            }
        }
        catch (SecurityException e) {
            System.out.println("SecurityException");
            e.printStackTrace();
            Error.send404(req, res);
        }
        catch (NoSuchMethodException e) {
            System.out.println("NoSuchMethodException");
            e.printStackTrace();
            Error.send404(req, res);
        }
        catch (IllegalArgumentException e) {
            System.out.println("IllegalArgumentException");
            e.printStackTrace();
            Error.send404(req, res);
        }
        catch (IllegalAccessException e) {
            System.out.println("IllegalAccessException");
            e.printStackTrace();
            Error.send404(req, res);
        }
        catch (InvocationTargetException e) {
            System.out.println("InvocationTargetException");
            e.printStackTrace();
            Error.send404(req, res);
        }

    }

    public ArrayList<String> getMethodsNames(Method[] methods) {
        ArrayList<String> methodsNames = new ArrayList<String>();

        for (Method method : methods) {
            methodsNames.add(method.getName());
        }

        return methodsNames;
    }

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