package database;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "Module")
public class Form {
   private int id;
   private String name;
   private int date;
   private int idTeacher;

   public Form() {}
   public Form(int id, String name) {
      this.id = id;
      this.name = name;
   }
   public int getId() {
      return id;
   }
   public void setId(int id) {
      this.id = id;
   }

   public String getName() {
       return this.name;
   }
   public void setId(String name) {
      this.name = name;
   }
}