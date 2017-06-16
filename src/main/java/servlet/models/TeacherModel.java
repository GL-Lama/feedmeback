package servlet.models;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import database.Database;
import database.Form.Form;
import database.Module.Module;
import database.Teacher.Teacher;
import servlet.core.Model;

public class TeacherModel extends Model {

	public ArrayList<Form> forms;
	public ArrayList<Module> modules;

	public TeacherModel() {}
	public TeacherModel(Database db) {
		super(db);
	}

	public void fetchModules() {
		this.modules = this.teacher.fetchModules();
	}

	public void fetchForms() {
		List table;

		Map<String, String> params = new HashMap<String, String>();
		params.put("idTeacher", "" + this.teacher.getIdTeacher());

		table = this.db.select("Form", params);

		this.forms = new ArrayList<Form>();

		for (Object form: table)
			this.forms.add((Form) form);
	}

	public Teacher getTeacher() {
		return this.teacher;
	}

	public ArrayList<Form> getForms() {
		return this.forms;
	}

	public ArrayList<Module> getModules(){
		return this.modules;
	}
}