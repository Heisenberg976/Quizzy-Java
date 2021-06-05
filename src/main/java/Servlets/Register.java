package Servlets;

import DB.USER.User;
import DB.USER.UserDAO;
import Database.Db;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/register")

public class Register extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("movedi");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String Rpassword = request.getParameter("Rpassword");


        if (email != null && password != null && name != null && Rpassword != null) {
            try {
                UserDAO userdao = new UserDAO(new Db().getCon());
                if (userdao.select(email) != null) {
                    request.setAttribute("error", "Account Already Exists with Same Email");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                } else if (password.equals(Rpassword)) {
                    User user = new User(name,email, password);
                    userdao.addUser(user);
                    request.getRequestDispatcher("login.jsp").forward(request, response);

                } else {
                    request.setAttribute("error", "Passwords Dont Match");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                }

            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }
}
