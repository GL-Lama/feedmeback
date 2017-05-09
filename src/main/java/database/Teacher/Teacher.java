package database.Teacher;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "Teacher")
public class Teacher {
   private int idTeacher;
   private String username;
   private String password;
   private String accessToken;

   public Teacher() {}
   public Teacher(String username, String password, String accessToken) {
      this.username = username;
      this.password = password;
      this.accessToken = accessToken;
   }
   public int getIdTeacher() {
      return this.idTeacher;
   }
   public void setIdTeacher( int idTeacher ) {
      this.idTeacher = idTeacher;
   }
   public String getUsername() {
      return username;
   }
   public void setUsername( String username ) {
      this.username = username;
   }
   public String getPassword() {
      return password;
   }
   public void setPassword( String password ) {
      this.password = password;
   }
   public String getAccessToken() {
      return accessToken;
   }
   public void setAccessToken( String accessToken ) {
      this.accessToken = accessToken;
   }
}