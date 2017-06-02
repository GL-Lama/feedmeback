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
import database.Question.Question;
import database.Proposition.Proposition;
import database.Student.Student;
import servlet.core.Model;
import utils.console;

public class FormModel extends Model {

    public Database db;
    public Student student;
    public ArrayList<Module> modules;
    public ArrayList<Form> forms;
    public String username;
    public Module module;
    public Form form;
    public Question question;
    public Proposition proposition;
    public ArrayList<Question> questions;
    public ArrayList<ArrayList<Proposition>> propositions;

    public Boolean init(Database db, String username, String idForm) {

        this.db = db;
        this.username = username;

        this.getForm(idForm);

        return true;
    }

    public void getForm(String idForm){
        Session session = Database.factory.openSession();
        Transaction tx = null;

        List table = null;

        try{
            tx = session.beginTransaction();

            // Query the form
            Map<String, String> params = new HashMap<String, String>();

            params.put("idForm", idForm);

            this.form = (Form) this.db.selectOne("Form", params);

            // Query the module
            params = new HashMap<String, String>();

            params.put("idModule", this.form.getIdModule() + "");

            this.module = (Module) this.db.selectOne("Module", params);

            tx.commit();
        } catch (HibernateException e) {
            if (tx!=null)
                tx.rollback();

            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void fetchQuestions(String idForm) {
        Session session = Database.factory.openSession();
        Transaction tx = null;

        List table = null;

        this.propositions = new ArrayList<ArrayList<Proposition>>();

        try{
            tx = session.beginTransaction();

            String query = "FROM Question fo WHERE fo.idForm ='" + idForm + "'";

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

        this.questions = new ArrayList<Question>();

        for (int i = 0; i < table.size(); i++) {
            this.questions.add((Question) table.get(i));
        }
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
            this.modules.add((Module) table.get(i));
        }
    }

    public void fetchForms() {
        Session session = Database.factory.openSession();
        Transaction tx = null;

        List table = null;

        try{
            tx = session.beginTransaction();

            String query = "FROM Form fo WHERE fo.idModule IN (SELECT jm.idModule FROM JoinModule jm, Student stu WHERE jm.idStudent=stu.idStudent AND stu.username='" + this.username + "')";

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

        this.forms = new ArrayList<Form>();

        for (int i = 0; i < table.size(); i++) {
            this.forms.add((Form) table.get(i));
        }
    }

    public void fetchPropositions(String idQuestion) {
        Session session = Database.factory.openSession();
        Transaction tx = null;

        List table = null;

        try{
            tx = session.beginTransaction();

            String query = "FROM Proposition fo WHERE fo.idQuestion ='" + idQuestion + "'";

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

        ArrayList<Proposition> props = new ArrayList<Proposition>();

        for (int i = 0; i < table.size(); i++) {
            props.add((Proposition) table.get(i));
        }

        this.propositions.add(props);
    }

    public String getUsername(){
        return this.username;
    }

    public ArrayList<Module> getModules(){
        return this.modules;
    }

    public ArrayList<Form> getForms(){
        return this.forms;
    }

    public Form getForm(){
        return this.form;
    }

    public Module getModule(){
        return this.module;
    }

    public ArrayList<Question> getQuestions(){
        return this.questions;
    }

    public ArrayList<Proposition> getPropositions(int index) {
        return this.propositions.get(index);
    }

}