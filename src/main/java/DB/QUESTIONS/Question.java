package DB.QUESTIONS;

public class Question {
    private int categoryID;
    private String question;
    private String a;
    private String b;
    private String c;
    private String d;
    private int correct;

    public Question(int categoryID, String question, String a, String b, String c, String d, int correct) {
        this.categoryID  = categoryID;
        this.question = question;
        this.a = a;
        this.b = b;
        this.c = c;
        this.d = d;
        this.correct = correct;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public String getQuestion() {
        return question;
    }

    public String getA() {
        return a;
    }

    public String getB() {
        return b;
    }

    public String getC() {
        return c;
    }

    public String getD() {
        return d;
    }

    public int getCorrect() {
        return correct;
    }



}


