package servlet.models;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import database.Database;
import database.Form.Form;
import database.Module.Module;
import database.Student.Student;
import database.Teacher.Teacher;
import servlet.core.Model;
import utils.console;

public class ModuleManagerModel extends Model {

    public Database db;
    public Teacher teacher;
    public String username;
    public ArrayList<Module> modules;

    public Boolean init(Database db, String username) {

        this.db = db;
        this.username = username;

        return true;
    }

    public void searchModules(String moduleName) {
        Session session = Database.factory.openSession();
        Transaction tx = null;

        List table = null;

        try{
            tx = session.beginTransaction();

            String query = "FROM Module mod WHERE mod.name LIKE '%" + moduleName + "%'";

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

        if (table != null)
            for (int i = 0; i < table.size(); i++) {
                this.modules.add((Module) table.get(i));
            }

    }

    public String getUsername(){
        return this.username;
    }

    public ArrayList<Module> getModules(){
        return this.modules;
    }

}