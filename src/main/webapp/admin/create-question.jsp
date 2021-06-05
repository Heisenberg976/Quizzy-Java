<%@ page import="DB.QUESTIONS.Question" %>
<%@ page import="DB.QUESTIONS.QuestionDAO" %>
<%@ page import="Database.Db" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Objects" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<body>
<div class="list-group" style="float:left;margin-top:20px; width:200px">
    <a href="create-category.jsp" class="list-group-item list-group-item-action ">Categories</a>
    <a href="create-question.jsp" class="list-group-item list-group-item-action active">Question</a>
    <a href="../index.jsp" class="list-group-item list-group-item-action">User</a>
    <a href="/logout" class="list-group-item list-group-item-action ">Sign out</a>
</div>

<div class="container">
    <a href="addQuestion.jsp" class="btn btn-primary" style="margin-top:20px;width:80px">Add</a>
    <div class="row">
        <%
            ArrayList<Question> arr = null;
            QuestionDAO questionDAO = null;
            try {
                questionDAO = new QuestionDAO(new Db().getCon());
                arr = questionDAO.getAll();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            for (int i = 0; i < Objects.requireNonNull(arr).size(); i++) {
                Question question  = arr.get(i);
        %>
           <div class = "col-md-3" style = "margin-left:10%;">
        <div class="card" style="margin-bottom:15px;width:18rem;">
            <div class="card-body">
                <h5 class="card-title"><%=question.getQuestion()%></h5>
                <a href="editQuestion.jsp?name=<%=question.getQuestion()%>" class="btn btn-primary">Edit</a>
                <a href="deleteQuestion.jsp?name=<%=question.getQuestion()%>" class="btn btn-danger" style="margin-left:15px">Delete</a>
            </div>
        </div>
    </div>
        <%}%>

</div>
</div>

</body>
</html>