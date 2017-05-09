package servlet.models;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import javax.print.DocFlavor.STRING;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.sql.ordering.antlr.Factory;

import database.Database;
import database.Form.Form;
import database.Module.Module;
import database.Student.Student;
import servlet.core.Model;
import utils.console;

public class StudentModel extends Model {

    public Database db;
    public Student student;
    public ArrayList<Module> modules;
    public Form[] forms;
    public String username;
    public Module module;

    public Boolean init(Database db, String username) {

        this.db = db;
        this.username = username;

        this.fetchModules();

        return true;
    }

    public void fetchModules() {
        Session session = Database.factory.openSession();
        Transaction tx = null;

        List table = null;

        try{
            tx = session.beginTransaction();

            String query = "FROM Module mod WHERE mod.idModule IN (SELECT modu.idModule FROM Module modu, Student stu, JoinModule jm WHERE stu.username='" + this.getUsername() + "' AND jm.idStudent=stu.idStudent AND jm.idModule=modu.idModule)";

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

    public String getUsername(){
        return this.username;
    }

    public ArrayList<Module> getModules(){
        return this.modules;
    }

}