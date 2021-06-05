package DB.RESULT;

import DB.QUESTIONS.Question;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ResultDAO {
    private Connection con;

    public ResultDAO(Connection con) throws SQLException {
        this.con = con;
        PreparedStatement st = con.prepareStatement("use quizz");
        st.execute();
    }

    public void addResult(Result result) {
        try {
            PreparedStatement st = con.prepareStatement("insert into results (email,score,categoryID)   values(?,?,?)");
            st.setString(1, result.getEmail());
            st.setDouble(2, result.getScore());
            st.setInt(3, result.getCategoryID());
            st.executeUpdate();


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

}
