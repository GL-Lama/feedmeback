package database.SubscribeModule;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "SubscribeModule")
public class SubscribeModule {
   private int idModule;
   private int idTeacher;

   public SubscribeModule() {}
   public SubscribeModule(int idModule, int idTeacher) {
      this.idModule = idModule;
      this.idTeacher = idTeacher;
   }

   public int getIdModule() {
      return idModule;
   }

   public void setIdModule(int idModule) {
      this.idModule = idModule;
   }

   public int getIdTeacher() {
       return this.idTeacher;
   }

   public void setIdTeacher(int idTeacher) {
      this.idTeacher = idTeacher;
   }
}