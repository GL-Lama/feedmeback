package database.Module;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "Module")
public class Module {
   private int idModule;
   private String name;

   public Module() {}
   public Module(int idModule, String name) {
      this.idModule = idModule;
      this.name = name;
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
}