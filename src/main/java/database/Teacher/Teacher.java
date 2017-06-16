package database.Teacher;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import database.Database;
import database.Module.Module;
import utils.console;

@Entity
@Table(name = "Teacher")
public class Teacher {
	private int idTeacher;
	private String username;
	private String password;
	private String accessToken;

	public Teacher() {}
	public Teacher(String username, String password, String accessToken) {
		this.username = username;
		this.password = password;
		this.accessToken = accessToken;
	}

	public int getIdTeacher() {
		return this.idTeacher;
	}

	public void setIdTeacher( int idTeacher ) {
		this.idTeacher = idTeacher;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername( String username ) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword( String password ) {
		this.password = password;
	}

	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken( String accessToken ) {
		this.accessToken = accessToken;
	}

	 public ArrayList<Module> fetchModules() {
		Session session = Database.factory.openSession();
		Transaction tx = null;

		List table = null;

		try{
			tx = session.beginTransaction();

			String query = "FROM Module mod WHERE mod.idModule IN (SELECT modu.idModule FROM Module modu, Teacher tea, SubscribeModule sm WHERE tea.username='" + this.getUsername() + "' AND sm.idTeacher=tea.idTeacher AND sm.idModule=modu.idModule)";

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

		ArrayList<Module> modules = new ArrayList<Module>();

		for (int i = 0; i < table.size(); i++) {
			Module module = (Module) table.get(i);
			console.log("MODULE NAME", module.getName());
			modules.add((Module) table.get(i));
		}

		return modules;
	 }
}