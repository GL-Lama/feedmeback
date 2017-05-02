package servlet.models;

import java.util.HashMap;
import java.util.Map;

import database.Database;
import database.Form;
import database.Teacher;
import servlet.core.Model;
import utils.console;

public class TeacherModel extends Model {

    public Database db;
    public Teacher teacher;
    public Form form;
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

        // Query the teacher
        Map<String, String> paramsForm = new HashMap<String, String>();

        paramsForm.put("idTeacher", "" + this.teacher.getId());
        this.form = (Form) this.db.selectOne("Form",paramsForm); 

        return true;
    }

    public String getUsername() {
        return this.username;
    }

    public Teacher getTeacher() {
        return this.teacher;
    }

    public Form getForm() {
        return this.form;
    }
}