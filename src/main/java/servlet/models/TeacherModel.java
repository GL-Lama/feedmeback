package servlet.models;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import database.Database;
import database.Form.Form;
import database.Module.Module;
import database.Teacher.Teacher;
import servlet.core.Model;
import utils.console;

public class TeacherModel extends Model {

    public Database db;
    public Teacher teacher;
    public ArrayList<Form> forms;
    public String username;
    public ArrayList<Module> modules;

    public Boolean init(Database db, String username) {

        this.db = db;
        this.username = username;
        
        this.fetchModules();

        // Query the student
        Map<String, String> params = new HashMap<String, String>();

        params.put("username", username);
        this.teacher = (Teacher) this.db.selectOne("Teacher", params);

        if (this.teacher == null)
            return false;

        List table;

        // Query the teacher
        Map<String, String> paramsForm = new HashMap<String, String>();
        paramsForm.put("idTeacher", "" + this.teacher.getIdTeacher());

        table = this.db.select("Form", paramsForm);

        this.forms = new ArrayList<Form>();

        for (Object form: table) {
            this.forms.add((Form) form);
        }

        return true;
    }

    public void fetchModules() {
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

        this.modules = new ArrayList<Module>();

        for (int i = 0; i < table.size(); i++) {
            Module module = (Module) table.get(i);
            console.log("MODULE NAME", module.getName());
            this.modules.add((Module) table.get(i));
        }
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

    public ArrayList<Module> getModules(){
        console.log("LOL", this.modules.get(0).getName());
        ArrayList<Module> test = new ArrayList<Module>();
        test.add(new Module(1, "lol"));
        return test;
        // return this.modules;
    }
}