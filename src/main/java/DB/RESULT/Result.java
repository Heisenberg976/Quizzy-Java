package DB.RESULT;

public class Result {
    private String email;
    private double score;
    private int categoryID;

    public Result(String email, double score, int categoryID) {
        this.email = email;
        this.score = score;
        this.categoryID = categoryID;
    }

    public String getEmail() {
        return email;
    }

    public double getScore() {
        return score;
    }

    public int getCategoryID() {
        return categoryID;
    }
}
