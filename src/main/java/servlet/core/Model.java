package servlet.core;

import java.util.HashMap;
import java.util.Map;

import database.Database;
import database.Student.Student;
import database.Teacher.Teacher;

public abstract class Model {

    public Database db;
    public Teacher teacher;
    public Student student;

    public Model() {}

    public Model(Database db) {
        this.db = db;
    }

    public void loadStudent(String username) {

        Map<String, String> params = new HashMap<String, String>();
        params.put("username", username);

        this.student = (Student) this.db.selectOne("Student", params);
    }

    public void loadTeacher(String username) {

        Map<String, String> params = new HashMap<String, String>();
        params.put("username", username);

        this.teacher = (Teacher) this.db.selectOne("Teacher", params);
    }

}