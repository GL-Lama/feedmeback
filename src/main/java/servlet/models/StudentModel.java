package servlet.models;

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
import database.Form;
import database.Module;
import database.Student;
import servlet.core.Model;
import utils.console;

public class StudentModel extends Model {

    public Database db;
    public Student student;
    public Module[] modules;
    public Form[] forms;
    public String username;
    public String moduleName;

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

            String query = "SELECT module.name FROM module natural join student natural join joinModule WHERE student.username='student'";


            console.log("Query :", query);

            table = session.createSQLQuery(query).list();

            tx.commit();
        } catch (HibernateException e) {
            if (tx!=null)
                tx.rollback();

            e.printStackTrace();
        } finally {
            session.close();
        }

        this.modules = new Module[table.size()];

        this.moduleName = (String) table.get(0);

        // this.modules[0] = (Module) table.get(0);

        // console.log((String) table.get(0));
    }

    public String getUsername(){
        return this.username;
    }

    public String getModuleName(){
        List table = null;
        return this.moduleName = (String) table.get(0);
    }

}