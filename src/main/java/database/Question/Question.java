package database.Question;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "Question")
public class Question {
    private int idQuestion;
    private int idForm;
    private int numQuestion;
    private String question;
    private int idType;

   public Question() {}
   public Question(int idQuestion, int idForm, int numQuestion, String question, int idType) {
      this.idQuestion = idQuestion;
      this.idForm = idForm;
      this.numQuestion = numQuestion;
      this.question = question;
      this.idType = idType;
   }

    public int getIdQuestion() {
        return idQuestion;
    }

    public void setIdQuestion(int idQuestion){
        this.idQuestion = idQuestion;
    }

    public int getIdForm() {
        return idForm;
    }

    public void setIdForm(int idForm){
        this.idForm = idForm;
    }

    public int getNumQuestion() {
        return numQuestion;
    }

    public void setNumQuestion(int numQuestion) {
        this.numQuestion = numQuestion;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public int getIdType() {
        return this.idType;
    }

    public void setIdType(int idType) {
        this.idType = idType;
    }
}