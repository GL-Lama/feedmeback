package database.Form;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "Form")
public class Form {
   private int idForm;
   private String name;
   private int date;
   private int idTeacher;
   private int idModule;

   public Form() {}
   public Form(int idForm, String name, int idTeacher, int date) {
      this.idForm = idForm;
      this.name = name;
      this.date = date;
   }

    public int getIdTeacher() {
        return idTeacher;
    }

    public void setIdTeacher(int idTeacher){
        this.idTeacher = idTeacher;
    }

    public int getIdForm() {
        return idForm;
    }

    public void setIdForm(int idForm) {
        this.idForm = idForm;
    }

    public int getIdModule() {
        return idModule;
    }

    public void setIdModule(int idModule) {
        this.idModule = idModule;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getDate() {
        return this.date;
    }

    public void setDate(int date) {
        this.date = date;
    }

}