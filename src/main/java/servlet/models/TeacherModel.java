package servlet.models;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import database.Database;
import database.Form.Form;
import database.Teacher.Teacher;
import servlet.core.Model;
import utils.console;

public class TeacherModel extends Model {

    public Database db;
    public Teacher teacher;
    public ArrayList<Form> forms;
    public String username;

    public Boolean init(Database db, String username) {

        this.db = db;
        this.username = username;

        // Query the student
        Map<String, String> params = new HashMap<String, String>();

        params.put("username", username);
        this.teacher = (Teacher) this.db.selectOne("Teacher", params);

        if (this.teacher == null)
            return false;

        List table;

        // Query the teacher
        Map<String, String> paramsForm = new HashMap<String, String>();
        paramsForm.put("idTeacher", "" + this.teacher.getId());

        table = this.db.select("Form", paramsForm);

        this.forms = new ArrayList<Form>();

        for (Object form: table) {
            Form _form = (Form) form;
            console.log(_form.getDate());
            this.forms.add((Form) form);
        }

        return true;
    }

    public String getUsername() {
        return this.username;
    }

    public Teacher getTeacher() {
        return this.teacher;
    }

    public ArrayList<Form> getForms() {
        return this.forms;
    }
}