package Servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/")
public class SessionCheck extends HttpServlet {
    public void check(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if(request.getSession(false ).getAttribute("email") == null){
            System.out.println("arali");
            response.sendRedirect("login.jsp");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//        System.out.println("get");

        check(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        System.out.println("post");
        check(request,response);
     }
}
