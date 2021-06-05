package DB.CATEGORIES;

import DB.USER.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CategorieDAO {
    private Connection con;

    public CategorieDAO(Connection con) throws SQLException {
        this.con = con;
        PreparedStatement st = con.prepareStatement("use quizz");
        st.execute();
    }

    public void addCategorie(Categorie categorie) {
        try {
            PreparedStatement st = con.prepareStatement("insert into categories (name) values(?)");
            st.setString(1, categorie.getName());
            st.executeUpdate();


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    public void deleteCategorie(Categorie categorie) {
        try {
            PreparedStatement st = con.prepareStatement("delete from categories where name = ?");
            st.setString(1, categorie.getName());
            st.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public ArrayList<Categorie> getAll() {
        ArrayList<Categorie> categories = new ArrayList<>();
        try {
            PreparedStatement st = con.prepareStatement("select* from categories");
            ResultSet res = st.executeQuery();
            while (res.next()) {
                categories.add(new Categorie(res.getString(2)));
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();

        }
        return categories;
    }


    public void edit(Categorie categorie, String newName) {
        try {
            PreparedStatement st = con.prepareStatement("update categories set name = ? where name = ?");
            st.setString(2, categorie.getName());
            st.setString(1, newName);

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean select(String name) {
        ResultSet res = null;
        try {
            PreparedStatement st = con.prepareStatement("select* from categories where name = ? ");
            st.setString(1, name);
            res = st.executeQuery();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return res != null;
    }

    public int getID(String name) {
        ResultSet res = null;
        int id = 0;
        try {
            PreparedStatement st = con.prepareStatement("select id  from categories where name = ? ");
            st.setString(1, name);
            res = st.executeQuery();
            while (res.next()) {
                id = res.getInt(1);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return id;
    }

}
