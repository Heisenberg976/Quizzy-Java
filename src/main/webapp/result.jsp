<%@ page import="DB.QUESTIONS.QuestionDAO" %>
<%@ page import="Database.Db" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="DB.QUESTIONS.Question" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="DB.RESULT.Result" %>
<%@ page import="DB.RESULT.ResultDAO" %>
<%@ page import="DB.RESULT.MailSender" %>
<html>

<head>
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css' rel='stylesheet'
          integrity='sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1' crossorigin='anonymous'>
</head>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    QuestionDAO questionDAO = null;
    try {
        questionDAO = new QuestionDAO(new Db().getCon());
    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }
    assert questionDAO != null;
    ArrayList<Question> list = questionDAO.getAll();
    int counter = 0;
    int questions = 0;

    for (int i = 0; i < list.size(); i++) {
        int selected;
        if (list.get(i).getCategoryID() == id) {
            questions++;
            if (request.getParameter("question" + i) != null) {
                selected = Integer.parseInt(request.getParameter("question" + i));
//                System.out.println(request.getParameter("answer1"));
                if (Integer.parseInt(request.getParameter("answer" + i)) == selected) {
                    counter++;
//                    System.out.println(counter + " " +  "quest:" + questions);
                }
            }
        }
    }
    String user = (String) session.getAttribute("name");
    String email = (String) session.getAttribute("email");

    double score =  (counter * 100) / questions;
    String message = "";
    if (score > 70) message = "Well Done," + user;
    if (score < 70) message = "Very Good, " + user;
    if (score < 50) message = "Try Again, " + user + " you can do better";
    Result result = new Result(user,score,id);
    try {
        ResultDAO resultDAO = new ResultDAO(new Db().getCon());
        resultDAO.addResult(result);
    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }

   String mailHTML  = "<body><div class='container' style='text-align:center;margin-top:10%'><h1>" + message +"</h1> <h2>You got "+ score +"%</h2> </div> </body>";
    MailSender sender = new MailSender(email,"Quizzy test result", mailHTML);
    sender.send();



%>
<body>
<div class='container' style='text-align:center;margin-top:10%'>
    <h1><%=message%>
    </h1>
    <h2>You got <%= score %>%</h2>
    <a href='category.jsp?id=<%=id%>' class='btn btn-primary'>Try Again</a>
    <a href='categories.jsp' class='btn btn-danger'>Exit</a>
</div>
</body>


</html>