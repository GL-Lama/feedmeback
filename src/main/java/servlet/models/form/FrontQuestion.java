package servlet.models.form;

import database.Question.Question;

public class FrontQuestion {

    public int idType;
    public String question;
    public String[] props;

    public FrontQuestion(int idType, String question, String[] props) {
        this.idType = idType;
        this.question = question;
        this.props = props;
    }

    public Question getDbQuestion(int numQuestion, int idForm) {
        Question question= new Question();
        question.setIdType(this.idType);
        question.setQuestion(this.question);
        question.setNumQuestion(numQuestion);
        question.setIdForm(idForm);
        return question;
    }

    @Override
    public String toString() {
        return this.idType + this.question;
    }
}