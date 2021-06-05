<%@ page import="DB.QUESTIONS.QuestionDAO" %>
<%@ page import="Database.Db" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DB.QUESTIONS.Question" %>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <a class="navbar-brand" href="#" style="margin-left: 50px">Quizzy</a>

    <div class="collapse navbar-collapse">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp">Home<span class="sr-only"></span></a>
            </li>
            <li class="nav-item">

                <a class="nav-link" href="categories.jsp">Categories<span class="sr-only"></span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login.jsp">Login</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/logout">Log Out</a>
            </li>


<%--            <li class="nav-item">--%>
<%--                <a class="nav-link" href="create-category.jsp">Admin</a>--%>
<%--            </li>--%>


        </ul>

    </div>
</nav>

<body style="background-color:#9cd1ff">
<form action="/result.jsp?id=<%=request.getParameter("id")%>" method="post">
    <%
        try {
            QuestionDAO questionDAO = new QuestionDAO(new Db().getCon());
            ArrayList<Question> list = questionDAO.getAll();

            for (int i = 0; i < list.size(); i++) {
//                System.out.println(request.getParameter("id"));
                if (list.get(i).getCategoryID() == Integer.parseInt(request.getParameter("id"))) {
                    Question question = list.get(i);

    %>


    <div class="container" style="background-color:white;   ">
        <h2><%=question.getQuestion()%></h2>
        <h5><label><input type="radio" value="0" name="question<%=i%>"><%=question.getA()%>
        </label></h5>
        <br>
        <h5><label><input type="radio" value="1" name="question<%=i%>"><%=question.getB()%>
        </label></h5>
        <br>
        <h5><label><input type="radio" value="2" name="question<%=i%>"><%=question.getC()%>
        </label></h5>
        <br>
        <h5><label><input type="radio" value="3" name="question<%=i%>"><%=question.getD()%>
        </label></h5>
        <br>

        <%--        correct answervvvvvvvvvvvvvvvvvvvv--%>
        <input type="hidden" value="<%=question.getCorrect()%>" name="answer<%=i%>">

            <%
    }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    %>
        <input type="submit" name="submit" class="btn btn-primary" style="margin-bottom:15px;margin-left:5%">
</form>


</body>
</html>