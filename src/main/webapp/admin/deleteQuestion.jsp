<%@ page import="Database.Db" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="DB.QUESTIONS.QuestionDAO" %>
<%
    String name = request.getParameter("name");
    System.out.println(name);
    QuestionDAO questionDAO = null;
    try {
        questionDAO = new QuestionDAO(new Db().getCon());
    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }
    assert questionDAO != null;
    questionDAO.deleteUser(name);
    System.out.println("oh, okay");
    request.getRequestDispatcher("create-question.jsp").forward(request, response);
%>