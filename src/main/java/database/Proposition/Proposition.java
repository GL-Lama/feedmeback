package database.Proposition;

import javax.persistence.Entity;
import javax.persistence.Table;

import utils.console;

@Entity
@Table(name = "Proposition")
public class Proposition {
    private int idProposition;
    private int idQuestion;
    private String proposition;
    private int numProposition;

   public Proposition() {}
   public Proposition(int idProposition, int idQuestion, String proposition, int numProposition) {
      this.idProposition = idProposition;
      this.idQuestion = idQuestion;
      this.proposition = proposition;
      this.numProposition = numProposition;
   }
   public Proposition(int idQuestion, String proposition, int numProposition) {
      this.idQuestion = idQuestion;
      this.proposition = proposition;
      this.numProposition = numProposition;
   }

    public int getIdProposition() {
        return idProposition;
    }

    public void setIdProposition(int idProposition){
        this.idProposition = idProposition;
    }

    public int getIdQuestion() {
        return idQuestion;
    }

    public void setIdQuestion(int idQuestion){
        this.idQuestion = idQuestion;
    }

    public String getProposition() {
        return proposition;
    }

    public void setProposition(String proposition){
        this.proposition = proposition;
    }

    public int getNumProposition() {
        return numProposition;
    }

    public void setNumProposition(int numProposition){
        this.numProposition = numProposition;
    }

}