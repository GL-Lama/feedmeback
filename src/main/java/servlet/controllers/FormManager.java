package servlet.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.core.Controller;


@WebServlet(
		name = "FormManager",
		value = "/formManager/*"
	)

public class FormManager extends Controller {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		this.initGet(req, res);

		this.callMethod(this, req, res, "formManager/");
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		this.doGet(req, res);
	}

	public void index(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.getRequestDispatcher("/views/form-manager/formManager.jsp").forward(req, res);
	}
}

