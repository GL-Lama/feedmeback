package database.Form;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "Form")
public class Form {
   private int idForm;
   private String name;
   private int startDate;
   private int endDate;
   private int idTeacher;
   private int idModule;

   public Form() {}
   public Form(int idForm, String name, int idTeacher, int startDate, int endDate) {
      this.idForm = idForm;
      this.name = name;
      this.idTeacher = idTeacher;
      this.startDate = startDate;
      this.endDate = endDate;
   }
   public Form(String name, int idTeacher, int startDate, int endDate, int idModule) {
      this.name = name;
      this.idTeacher = idTeacher;
      this.startDate = startDate;
      this.endDate = endDate;
      this.idModule = idModule;
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

    public int getStartDate() {
        return this.startDate;
    }

    public void setStartDate(int startDate) {
        this.startDate = startDate;
    }

    public int getEndDate() {
        return this.endDate;
    }

    public void setEndDate(int endDate) {
        this.endDate = endDate;
    }

}