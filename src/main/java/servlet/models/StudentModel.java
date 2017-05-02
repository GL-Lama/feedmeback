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
    public Module test;

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

            String query = "FROM Module WHERE idModule IN (SELECT module.idModule FROM Module, Student, JoinModule WHERE JoinModule.idTeacher=Module.isTeacher AND JoinModule.idModule=Module.idModule AND Student.username='student')";

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

        this.modules = new Module[table.size()];

        for (int i = 0; i < table.size(); i++) {
            this.modules[i] = (Module) table.get(i);
        }

        this.test = this.modules[0];
    }

    public String getUsername(){
        return this.username;
    }

    public Module getTest(){
        return this.test;
    }

}