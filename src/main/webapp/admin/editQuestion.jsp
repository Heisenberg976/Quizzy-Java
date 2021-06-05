<%@ page import="DB.QUESTIONS.Question" %>
<%@ page import="DB.QUESTIONS.QuestionDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Objects" %>
<%@ page import="Database.Db" %>
<%@ page import="DB.CATEGORIES.CategorieDAO" %>
<%@ page import="DB.CATEGORIES.Categorie" %>

<%
    if (request.getParameter("v") != null) {
           String question  = request.getParameter("question");
           String a = request.getParameter("a");
           String b = request.getParameter("b");
           String c = request.getParameter("c");
           String d = request.getParameter("d");
           String cat =  request.getParameter("categoryID");
           int correct = Integer.parseInt(request.getParameter("correct"));
           QuestionDAO dao = null;
           int categoryID = 0;
        try {
            CategorieDAO categorieDAO = new CategorieDAO(new Db().getCon());
            categoryID = categorieDAO.getID(cat);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        Question question1 = new Question(categoryID,question,a,b,c,d,correct);

        try {
            dao = new QuestionDAO(new Db().getCon());
            dao.addQuestion(question1);
            request.getRequestDispatcher("create-question.jsp").forward(request,response);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    else{
%>


<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

</head>
<body>

<div class="list-group" style="float:left;margin-top:20px; width:200px">

    <a href="create-category.jsp" class="list-group-item list-group-item-action ">Categories</a>
    <a href="create-question.jsp" class="list-group-item list-group-item-action active">Question</a>
    <a href="../index.jsp" class="list-group-item list-group-item-action">User</a>
    <a href="/logout" class="list-group-item list-group-item-action ">Sign out</a>

</div>

<div class="container">
    <div class="row">
        <%
            ArrayList<Question> arr = null;
            QuestionDAO questionDAO;
            try {
                questionDAO = new QuestionDAO(new Db().getCon());
                arr = questionDAO.getAll();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            Question question = null;
            for (int i = 0; i < arr.size(); i++) {
                if (request.getParameter("name").equals(arr.get(i).getQuestion())) {
                    question = arr.get(i);
                }
            }
            assert question != null;%>
        <div class="col-md-4">
            <form action="editQuestion.jsp?v=1" method="post" style="margin-top:20px">
                <div class="form-group">
                    <label>Question</label>
                    <input type="text" class="form-control" name="question" value="<%=question.getQuestion()%>">
                </div>

                <div class="form-group">
                    <label>A</label>
                    <input type="text" class="form-control" name="a" value="<%=question.getA()%>">
                </div>

                <div class="form-group">
                    <label>B</label>
                    <input type="text" class="form-control" name="b" value="<%=question.getB()%>">
                </div>

                <div class="form-group">
                    <label>C</label>
                    <input type="text" class="form-control" name="c" value="<%=question.getC()%>">
                </div>

                <div class="form-group">
                    <label>D</label>
                    <input type="text" class="form-control" name="d" value="<%=question.getD()%>">
                </div>

                <div class="form-group">
                    <label>Correct</label>
                    <select name="correct" class="form-control">
                        <%
                            if (question.getCorrect() == 0)
                        %>
                        <option selected value="0">A</option>


                        <% if (question.getCorrect() == 1) %>
                        <option selected value="1">B</option>
                        <% if (question.getCorrect() == 2) %>
                        <option selected value="2">C</option>
                        <% if (question.getCorrect() == 3) %>
                        <option selected value="3">D</option>

                        <br>


                    </select>

                    <br>
                    <select name="categoryID" class="form-control">
                        <%
                            ArrayList<Categorie> catt = null;
                            CategorieDAO categorieDAO = null;
                            try {
                                categorieDAO = new CategorieDAO(new Db().getCon());
                                catt = categorieDAO.getAll();
                            } catch (SQLException throwables) {
                                throwables.printStackTrace();
                            }
                            assert catt != null;
                            for (Categorie categorie : catt) {
                        %>
                        <option value="<%=categorie.getName()%>"><%=categorie.getName()%>
                        </option>
                        <%}
                        }
                        %>

                    </select>
                </div>
                <br>
                <input type="submit" name="submit" class="btn btn-success">
            </form>
        </div>
    </div>
</div>
</body>
</html>