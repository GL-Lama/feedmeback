package database;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "Module")
public class Form {
   private int idForm;
   private String name;
   private int date;
   private int idTeacher;

   public Form() {}
   public Form(int idForm, String name, int idTeacher) {
      this.idForm = idForm;
      this.name = name;
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

   public String getName() {
       return this.name;
   }
   public void setName(String name) {
      this.name = name;
   }
}