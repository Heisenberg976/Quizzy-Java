package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Db {
    Connection con;

    public Db() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(Info.host, Info.user, Info.password);
            PreparedStatement st = con.prepareStatement("use quizz");
            st.execute();
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

    }

    public Connection getCon() {
        return con;
    }

    public void closeConn() {
        try {
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}