package DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDAO {
    private Connection con;
    private int id;

    public UserDAO(Connection con) throws SQLException {
        this.con = con;
        PreparedStatement st = con.prepareStatement("use quizz");
        st.execute();

    }

    public void addUser(User user) {
        try {
            PreparedStatement st = con.prepareStatement("insert into users (email,password)   values(?,?)");
            st.setString(1, user.getUsername());
            st.setString(2, user.getPassword());
            st.executeUpdate();


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    public void deleteUser(User user) {
        try {
            PreparedStatement st = con.prepareStatement("delete from users where email = ?");
            st.setString(1, user.getUsername());
            st.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public ArrayList<User> getAll() {
        ArrayList<User> users = new ArrayList<>();
        try {
            PreparedStatement st = con.prepareStatement("select* from users");
            ResultSet res = st.executeQuery();
            while (res.next()) {
                users.add(new User(res.getString(2), res.getString(3)));
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();

        }
        return users;
    }


    void edit(User user) {
        try {
            PreparedStatement st = con.prepareStatement("update users set username = ?,password = ? where username = ?");

            st.setString(1, user.getUsername());
            st.setString(2, user.getPassword());
            st.setString(3, user.getUsername());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean select(String username, String password) {
        ResultSet res = null;
        try {
            PreparedStatement st = con.prepareStatement("select from users where email = ? and password = ?");
            st.setString(1, username);
            st.setString(2, password);
             res = st.executeQuery();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return res != null;
    }
}
