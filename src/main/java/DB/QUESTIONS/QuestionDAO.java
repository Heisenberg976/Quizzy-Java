package DB.QUESTIONS;

import DB.USER.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class QuestionDAO {
    private Connection con;

    public QuestionDAO(Connection con) throws SQLException {
        this.con = con;
        PreparedStatement st = con.prepareStatement("use quizz");
        st.execute();
    }

    public void addQuestion(Question question) {
        try {
            PreparedStatement st = con.prepareStatement("insert into questions (categoryID,question,a,b,c,d,correct)   values(?,?,?,?,?,?,?)");
            st.setInt(1, question.getCategoryID());
            st.setString(2, question.getQuestion());
            st.setString(3, question.getA());
            st.setString(4, question.getB());
            st.setString(5, question.getC());
            st.setString(6, question.getD());
            st.setInt(7, question.getCorrect());

            st.executeUpdate();


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    public void deleteUser(String question) {
        try {
            PreparedStatement st = con.prepareStatement("delete from questions where question = ?");
            st.setString(1, question);
            st.executeUpdate();
            System.out.println("deleted");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public  ArrayList<Question> getAll() {
        ArrayList<Question> questions = new ArrayList<>();
        try {
            PreparedStatement st = con.prepareStatement("select* from questions ORDER BY RAND ()  ");
            ResultSet res = st.executeQuery();
            while (res.next()) {
                questions.add(new Question(res.getInt(2), res.getString(3), res.getString(4), res.getString(5), res.getString(6), res.getString(7), res.getInt(8)));
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();

        }
        return questions;
    }


    void edit(Question question, String Question) {
        try {
            PreparedStatement st = con.prepareStatement("update  questions (categoryID,question,a,b,c,d,correct) values(?,?,?,?,?,?,?) where question = ?");
            st.setInt(1, question.getCategoryID());
            st.setString(2, question.getQuestion());
            st.setString(3, question.getA());
            st.setString(4, question.getB());
            st.setString(5, question.getC());
            st.setString(6, question.getD());
            st.setInt(7, question.getCorrect());
            st.setString(8, Question);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean select(String question) {
        ResultSet res = null;
        try {
            PreparedStatement st = con.prepareStatement("select* from questions where question = ? ");
            st.setString(1, question);
            res = st.executeQuery();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return res != null;
    }
}
