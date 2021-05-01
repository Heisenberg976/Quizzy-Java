package DB;

import Database.Db;

import java.sql.SQLException;

public class tst {
    public static void main(String[] args) throws SQLException {
        Db db = new Db();
        User user = new User("nika","nika123");
        UserDAO userDAO = new UserDAO(db.getCon());
        userDAO.deleteUser(user);
    }


}
