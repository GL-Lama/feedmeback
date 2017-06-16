package servlet.models;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import database.Database;
import database.Form.Form;
import database.Module.Module;
import servlet.core.Model;
import utils.console;

public class StudentModel extends Model {

	public ArrayList<Module> modules;
	public ArrayList<Form> forms;
	public Module module;

	public StudentModel() {}
	public StudentModel(Database db) {
		super(db);
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

	public ArrayList<Module> getModules(){
		return this.modules;
	}

	public ArrayList<Form> getForms(){
		return this.forms;
	}

}