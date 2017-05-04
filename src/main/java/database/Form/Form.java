package database;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "Form")
public class Form {
   private int idForm;
   private String name;
   private int date;
   private int idTeacher;

   public Form() {}
   public Form(int idForm, String name, int idTeacher) {
      this.idForm = idForm;
      this.name = name;
    //   this.date = date;
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


//    public int getDate() {
//        return this.date;
//    }
//    public void setIdDate (int date){
//         this.date = date;
//    }


}