package servlet;

import javax.servlet.annotation.WebServlet;

import org.apache.catalina.servlets.DefaultServlet;

@WebServlet(
        name = "Default",
        value = "/static/*"
    )
public class Default extends DefaultServlet {}