package servlet.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Question.Question;
import servlet.core.Controller;
import servlet.models.FormModel;
import servlet.models.TeacherModel;
import utils.Auth;

@WebServlet(
		name = "Form",
		value = "/form/*"
	)
public class Form extends Controller {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		this.initGet(req, res);

		this.callMethod(this, req, res, "form/");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		this.doGet(req, res);
	}

	public void index(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String access_token = Auth.validate(req, res);

		if (access_token == null)
			return;

		String idForm = req.getParameter("id");

		FormModel formModel = new FormModel(this.db);
		formModel.loadStudent(Auth.getTokenClaim(access_token, "username"));

		formModel.loadForm(idForm);

		req.setAttribute("formModel", formModel);

		req.getRequestDispatcher("/views/form/form.jsp").forward(req, res);
	}

	public void newForm(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String access_token = Auth.validate(req, res);

		if (access_token == null)
			return;

		TeacherModel teacherModel = new TeacherModel(this.db);
		teacherModel.loadTeacher(Auth.getTokenClaim(access_token, "username"));
		teacherModel.modules = teacherModel.teacher.fetchModules();

		req.setAttribute("teacherModel", teacherModel);

		req.getRequestDispatcher("/views/form/newForm.jsp").forward(req, res);
	}

	public void formManager(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String access_token = Auth.validate(req, res);

		if (access_token == null)
			return;

		req.getRequestDispatcher("/views/formManager/formManager.jsp").forward(req, res);
	}

	public void formQuestion(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String access_token = Auth.validate(req, res);

		if (access_token == null)
			return;

		String idForm = req.getParameter("id");

		FormModel formModel = new FormModel(this.db);
		formModel.loadStudent(Auth.getTokenClaim(access_token, "username"));

		formModel.loadForm(idForm);

		formModel.fetchQuestions(idForm);
		for (Question question : formModel.getQuestions()){
			formModel.fetchPropositions(question.getIdQuestion() + "");
		}

		req.setAttribute("formModel", formModel);

		req.getRequestDispatcher("/views/form/formQuestion.jsp").forward(req, res);
	}

	public void addForm(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String access_token = Auth.validate(req, res);

		if (access_token == null)
			return;

		FormModel formModel = new FormModel(this.db);
		formModel.loadTeacher(Auth.getTokenClaim(access_token, "username"));

		boolean done = formModel.addForm(req);

		if (!done)
			res.sendError(400);
	}
}