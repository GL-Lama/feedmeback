package database;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "Student")
public class Student {
   private int idStudent;
   private String username;
   private String password;
   private String accessToken;

   public Student() {}
   public Student(String username, String password, String accessToken) {
      this.username = username;
      this.password = password;
      this.accessToken = accessToken;
   }
   public int getIdStudent() {
      return idStudent;
   }
   public void setIdStudent( int idStudent ) {
      this.idStudent = idStudent;
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