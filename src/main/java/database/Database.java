package database;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import utils.console;

public class Database {

    public static SessionFactory  factory;

    public Database() {
        try{
            Configuration cfg = new Configuration().configure();

            String production = System.getenv("production");

            if (production != null && production.equals("heroku")) {
                cfg.setProperty("hibernate.connection.url", "jdbc:mysql://wvulqmhjj9tbtc1w.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/vzxphm4y1e5b1dlp");
                cfg.setProperty("hibernate.connection.username", "t1bnzg3ih33jdae8");
                cfg.setProperty("hibernate.connection.password", "t2j0tm4e0r6vls9z");
            }

            ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(cfg.getProperties()).build();

            factory = cfg.buildSessionFactory(serviceRegistry);

        }catch (Throwable ex) {
            System.err.println("Failed to create sessionFactory object." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public List select(String name) {

        Session session = factory.openSession();
        Transaction tx = null;

        List table = null;

        try{
            tx = session.beginTransaction();

            String query = "FROM " + name + " ";

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

        return table;
    }

    public List select(String name, Map<String, String> params) {

        Session session = factory.openSession();
        Transaction tx = null;

        List table = null;

        try{
            tx = session.beginTransaction();

            String query = "FROM " + name + " ";

            query += "WHERE ";

            Set<String> keys = params.keySet();

            for (String key : keys) {
                query += key + " = " + params.get(key);
            }

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

        return table;
    }

    public Object selectOne(String name) {

        Session session = factory.openSession();
        Transaction tx = null;

        List table = null;

        try{
            tx = session.beginTransaction();

            String query = "FROM " + name + " ";

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

        if (table == null || table.size() < 1)
            return null;

        return table.get(0);
    }

    public Object selectOne(String name, Map<String, String> params) {

        Session session = factory.openSession();
        Transaction tx = null;

        List table = null;

        try{
            tx = session.beginTransaction();

            String query = "FROM " + name + " ";

            query += "WHERE ";

            Set<String> keys = params.keySet();

            for (String key : keys) {
                query += key + " = '" + params.get(key) +"' ";
            }

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

        if (table == null || table.size() < 1)
            return null;

        return table.get(0);
    }

    public boolean insert(String name, Object obj) {

        Session session = factory.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();

            session.save(obj);

            tx.commit();
        } catch (Exception e) {
            return false;
        }

        return true;
    }

    public boolean update(String name, Object obj) {

        Session session = factory.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();

            session.update(obj);

            tx.commit();
        } catch (Exception e) {
            return false;
        }

        return true;
    }

}