package database;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "JoinModule")
public class JoinModule {
   private int idModule;
   private int idTeacher;

   public JoinModule() {}
   public JoinModule(int idModule, int idTeacher) {
      this.idModule = idModule;
      this.idTeacher = idTeacher;
   }
   public int getIdModule() {
      return idModule;
   }
   public void setIdModule(int idModule) {
      this.idModule = idModule;
   }

   public int getidTeacher() {
       return this.idTeacher;
   }
   public void setidTeacher(int idTeacher) {
      this.idTeacher = idTeacher;
   }
}