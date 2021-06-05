package DB.CATEGORIES;

import Database.Db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Categorie {
    private final String name;
    private int id;

    public Categorie(String name) throws SQLException {
        this.name = name;
//        PreparedStatement st = con.prepareStatement("use quizz");
//        st.execute();
//        PreparedStatement st1 = con.prepareStatement("select id from categories where name ='"+name+"'");
//        ResultSet res = st1.executeQuery();
//        if(res!= null) this.id = res.getInt(1);

    }


    public String getName() {
        return name;
    }

//    public int getId() {
//        return id;
//    }

    @Override
    public String toString() {
        return "Categorie{" +
                "name='" + name + '\'' +
                '}';
    }
}
