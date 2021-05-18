package Servlets;

import DB.UserDAO;
import Database.Db;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")

public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if(email != null && password!= null ){
            try {
                UserDAO userdao = new UserDAO(new Db().getCon());
                if(userdao.select(email, password)){
                    HttpSession session = request.getSession();
                    session.setAttribute("email",email);
//                    session.setAttribute("password",password);

                }
                else{
                    request.setAttribute("error","Wrong Username Or Password");
                    request.getRequestDispatcher("login.jsp").forward(request,response);
                }

            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }
}
