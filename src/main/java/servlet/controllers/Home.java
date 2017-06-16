package servlet.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.core.Controller;
import servlet.models.AuthModel;
import servlet.models.StudentModel;
import servlet.models.TeacherModel;
import utils.Auth;

@WebServlet(
		name = "Home",
		value = "/"
	)
public class Home extends Controller {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		this.initGet(req, res);

		this.callMethod(this, req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		this.doGet(req, res);
	}

	public void index(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String access_token = Auth.validate(req, res);

		if (access_token == null)
			return;

		String scope = Auth.getTokenClaim(access_token, "scope");

		if (scope.equals("teacher")) {

			TeacherModel teacherModel = new TeacherModel(this.db);
			teacherModel.loadTeacher(Auth.getTokenClaim(access_token, "username"));
			teacherModel.fetchModules();
			teacherModel.fetchForms();

			req.setAttribute("teacher", teacherModel);

			req.getRequestDispatcher("/views/home/teacher.jsp").forward(req, res);
		}

		else if (scope.equals("student")) {

			StudentModel studentModel = new StudentModel(this.db);
			studentModel.loadStudent(Auth.getTokenClaim(access_token, "username"));
			studentModel.fetchModules();
			studentModel.fetchForms();

			req.setAttribute("student", studentModel);

			req.getRequestDispatcher("/views/home/student.jsp").forward(req, res);
		}

		else
			res.sendError(400);

	}

	public void login(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String username = req.getParameter("username");
		String password = req.getParameter("password");
		Boolean isTeacher = Boolean.parseBoolean(req.getParameter("isTeacher"));

		AuthModel authModel = new AuthModel();
		if (!authModel.init(this.db, username, password, isTeacher))
			res.sendError(400);

		authModel.doLogin(req, res);
	}

	public void logout(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		AuthModel authModel = new AuthModel(this.db);

		authModel.doLogout(req, res);
	}

}