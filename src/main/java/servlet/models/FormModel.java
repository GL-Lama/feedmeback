package servlet.models;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.google.gson.Gson;

import database.Database;
import database.Form.Form;
import database.Module.Module;
import database.Question.Question;
import database.Proposition.Proposition;
import database.Student.Student;
import database.Teacher.Teacher;
import servlet.core.Model;
import servlet.models.form.FrontQuestion;
import utils.console;

public class FormModel extends Model {

	public ArrayList<Module> modules;
	public ArrayList<Form> forms;
	public Module module;
	public Form form;
	public Question question;
	public Proposition proposition;
	public ArrayList<Question> questions;
	public ArrayList<ArrayList<Proposition>> propositions;

	public FormModel() {}
	public FormModel(Database db) {
		super(db);
	}

	public void loadForm(String idForm){
		Session session = Database.factory.openSession();
		Transaction tx = null;

		List table = null;

		try{
			tx = session.beginTransaction();

			// Query the form
			Map<String, String> params = new HashMap<String, String>();

			params.put("idForm", idForm);

			this.form = (Form) this.db.selectOne("Form", params);

			// Query the teacher
			params = new HashMap<String, String>();

			params.put("idTeacher", this.form.getIdTeacher()+"");

			this.teacher = (Teacher) this.db.selectOne("Teacher", params);

			// Query the module
			params = new HashMap<String, String>();

			params.put("idModule", this.form.getIdModule() + "");

			this.module = (Module) this.db.selectOne("Module", params);

			tx.commit();
		} catch (HibernateException e) {
			if (tx!=null)
				tx.rollback();

			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public void fetchQuestions(String idForm) {
		Session session = Database.factory.openSession();
		Transaction tx = null;

		List table = null;

		this.propositions = new ArrayList<ArrayList<Proposition>>();

		try{
			tx = session.beginTransaction();

			String query = "FROM Question fo WHERE fo.idForm ='" + idForm + "'";

			console.log("Query :", query);

			table = session.createQuery(query).list();

			tx.commit();
		} catch (HibernateException e) {
			if (tx!=null)
				tx.rollback();

			e.printStackTrace();
		} finally {
			session.close();
		}

		this.questions = new ArrayList<Question>();

		for (int i = 0; i < table.size(); i++) {
			this.questions.add((Question) table.get(i));
		}
	}

	public void fetchModules() {
		Session session = Database.factory.openSession();
		Transaction tx = null;

		List table = null;

		try{
			tx = session.beginTransaction();

			String query = "FROM Module mod WHERE mod.idModule IN (SELECT modu.idModule FROM Module modu, Student stu, JoinModule jm WHERE stu.username='" + this.student.getUsername() + "' AND jm.idStudent=stu.idStudent AND jm.idModule=modu.idModule)";

			console.log("Query :", query);

			table = session.createQuery(query).list();

			tx.commit();
		} catch (HibernateException e) {
			if (tx!=null)
				tx.rollback();

			e.printStackTrace();
		} finally {
			session.close();
		}

		this.modules = new ArrayList<Module>();

		for (int i = 0; i < table.size(); i++) {
			this.modules.add((Module) table.get(i));
		}
	}

	public void fetchForms() {
		Session session = Database.factory.openSession();
		Transaction tx = null;

		List table = null;

		try{
			tx = session.beginTransaction();

			String query = "FROM Form fo WHERE fo.idModule IN (SELECT jm.idModule FROM JoinModule jm, Student stu WHERE jm.idStudent=stu.idStudent AND stu.username='" + this.student.getUsername() + "')";

			console.log("Query :", query);

			table = session.createQuery(query).list();

			tx.commit();
		} catch (HibernateException e) {
			if (tx!=null)
				tx.rollback();

			e.printStackTrace();
		} finally {
			session.close();
		}

		this.forms = new ArrayList<Form>();

		for (int i = 0; i < table.size(); i++) {
			this.forms.add((Form) table.get(i));
		}
	}

	public void fetchPropositions(String idQuestion) {
		Session session = Database.factory.openSession();
		Transaction tx = null;

		List table = null;

		try{
			tx = session.beginTransaction();

			String query = "FROM Proposition fo WHERE fo.idQuestion ='" + idQuestion + "'";

			console.log("Query :", query);

			table = session.createQuery(query).list();

			tx.commit();
		} catch (HibernateException e) {
			if (tx!=null)
				tx.rollback();

			e.printStackTrace();
		} finally {
			session.close();
		}

		ArrayList<Proposition> props = new ArrayList<Proposition>();

		for (int i = 0; i < table.size(); i++) {
			props.add((Proposition) table.get(i));
		}

		this.propositions.add(props);
	}

	public boolean addForm(HttpServletRequest req) {

		String _formName = req.getParameter("formName");
		int _startDate = Integer.parseInt(req.getParameter("startDate"));
		int _endDate = Integer.parseInt(req.getParameter("endDate"));
		int _idModule = Integer.parseInt(req.getParameter("idModule"));
		String _questions = req.getParameter("questions");

		Gson gson = new Gson();
		FrontQuestion[] questions = gson.fromJson(_questions, FrontQuestion[].class);

		Form form = new Form(_formName, this.teacher.getIdTeacher(), _startDate, _endDate, _idModule);

		this.db.insert("Form", form);

		Map<String, String> params = new HashMap<String, String>();
		params.put("name", _formName);
		params.put("startDate", ""+ _startDate);
		params.put("endDate", ""+ _endDate);
		form = (Form) this.db.selectOne("Form", params);

		int idForm = form.getIdForm();

		for (int i = 0; i < questions.length; i++) {
			Question question = questions[i].getDbQuestion(i + 1, idForm);
			this.db.insert("Question", question);

			if (question.getIdType() != 3)
				continue;

			Map<String, String> paramsQuestion = new HashMap<String, String>();
			paramsQuestion.put("idForm", idForm+"");
			paramsQuestion.put("numQuestion", (i + 1)+"");
			question = (Question) this.db.selectOne("Question", paramsQuestion);

			int idQuestion = question.getIdQuestion();

			for (int j = 0; j < questions[i].props.length; j++) {
				String prop = questions[i].props[j];

				if (prop.length() == 0)
					continue;

				Proposition proposition = new Proposition(idQuestion, prop, j + 1);

				this.db.insert("Proposition", proposition);
			}
		}

		return true;
	}

	public ArrayList<Module> getModules(){
		return this.modules;
	}

	public ArrayList<Form> getForms(){
		return this.forms;
	}

	public Form getForm(){
		return this.form;
	}

	public Module getModule(){
		return this.module;
	}

	public ArrayList<Question> getQuestions(){
		return this.questions;
	}

	public ArrayList<Proposition> getPropositions(int index) {
		return this.propositions.get(index);
	}

}