package database.JoinModule;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "JoinModule")
public class JoinModule {
   private int idModule;
   private int idStudent;

   public JoinModule() {}
   public JoinModule(int idModule, int idStudent) {
      this.idModule = idModule;
      this.idStudent = idStudent;
   }

   public int getIdModule() {
      return idModule;
   }

   public void setIdModule(int idModule) {
      this.idModule = idModule;
   }

   public int getIdStudent() {
       return this.idStudent;
   }

   public void setIdStudent(int idStudent) {
      this.idStudent = idStudent;
   }
}