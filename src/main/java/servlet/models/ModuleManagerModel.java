package servlet.models;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import database.Database;
import database.Module.Module;
import database.Student.Student;
import database.SubscribeModule.SubscribeModule;
import database.Teacher.Teacher;
import servlet.core.Model;
import utils.console;

public class ModuleManagerModel extends Model {

	public String username;
	public ArrayList<Module> modules;
	public ArrayList<Integer> joinedModules;

	public Module module;
	public ArrayList<Student> students;

	public ModuleManagerModel() {}
	public ModuleManagerModel(Database db) {
		super(db);
	}

	public Boolean init(Database db, String username) {

		this.db = db;
		this.username = username;

		// Query the student
		Map<String, String> params = new HashMap<String, String>();

		params.put("username", username);
		this.teacher = (Teacher) this.db.selectOne("Teacher", params);

		if (this.teacher == null)
			return false;

		return true;
	}

	public void searchModules(String moduleName) {
		Session session = Database.factory.openSession();
		Transaction tx = null;

		List table = null;

		try{
			tx = session.beginTransaction();

			String query = "FROM Module mod WHERE mod.name LIKE '%" + moduleName + "%'";
			// String query2 = "SELECT module.idModule from module, subscribemodule WHERE subscribemodule.idModule = module.idModule AND subscribemodule.idTeacher='" + this.teacher.getIdTeacher() + "'";

			//String query = "SELECT module.name FROM Module mod, subscribemodule subs WHERE mod.name LIKE '%" + moduleName + "%' AND subs.idModule = mod.idModule";
			//Select * from module modu, teacher tea, subscribemodule sm where modu.name like '%geni%' OR (sm.idTeacher='3')

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

		ArrayList<Module> subModules = this.teacher.fetchModules();

		this.modules = new ArrayList<Module>();

		if (table != null)
			for (int i = 0; i < table.size(); i++) {
				Module module = (Module) table.get(i);

				for (Module mod : subModules)
					if (mod.getIdModule() == module.getIdModule())
						module.setSub(true);

				this.modules.add(module);
			}

	}

	public String getUsername(){
		return this.username;
	}

	public ArrayList<Module> getModules() {
		return this.modules;
	}

	public ArrayList<Student> getStudents() {
		return this.students;
	}

	public Module getModule() {
		return this.module;
	}

	public int addModule(String moduleName, utils.Student[] students){
		Session session = Database.factory.openSession();
		Transaction tx = null;

		Module module = new Module(moduleName);

		int idModule = 0;

		try{
			tx = session.beginTransaction();

			this.db.insert("Module", module);

			Map<String, String> params = new HashMap<String, String>();
			params.put("name", module.getName());
			module = (Module) this.db.selectOne("Module", params);
			idModule = module.getIdModule();

			String query = "INSERT into joinmodule (idStudent, idModule) SELECT idStudent, idModule from student, module where username IN (";

			for (int i = 0; i < students.length; i++) {
				query += "'" + students[i].name;
				if (i != students.length - 1)
					query += "', ";
				else
					query += "' ";
			}

			query += ") AND IdModule = '" + module.getIdModule() + "'";

			console.log("Query :", query);

			session.createSQLQuery(query).executeUpdate();

			System.out.println(idModule);
			System.out.println(this.teacher.getIdTeacher());

			this.joinModule(idModule+"");

			tx.commit();
		} catch (HibernateException e) {
			if (tx!=null)
				tx.rollback();

			e.printStackTrace();
		} finally {
			session.close();
		}

		return idModule;
	}

	public void loadModule(String idModule) {

		Map<String, String> params = new HashMap<String, String>();
		params.put("idModule", idModule);

		this.module = (Module) this.db.selectOne("Module", params);
	}

	public void loadStudents(Module module){

		Session session = Database.factory.openSession();
		Transaction tx = null;

		List table = null;

		try{
			tx = session.beginTransaction();

			String query = "Select stu FROM Student stu, JoinModule jm WHERE stu.idStudent=jm.idStudent AND jm.idModule='" + module.getIdModule() + "'";

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

		this.students = new ArrayList<Student>();

		for (Object obj : table)
			this.students.add((Student) obj);
	}

	public void joinModule(String idModule){
		Session session = Database.factory.openSession();
		Transaction tx = null;

		try{
			tx = session.beginTransaction();

			SubscribeModule sm = new SubscribeModule(Integer.parseInt(idModule), teacher.getIdTeacher());

			console.log(Integer.parseInt(idModule), teacher.getIdTeacher());

			this.db.insert("SubscribeModule", sm);

			tx.commit();
		} catch (HibernateException e) {
			if (tx!=null)
				tx.rollback();

			e.printStackTrace();
		} finally {
			session.close();
		}

	}

}