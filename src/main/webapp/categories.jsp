<%@ page import="DB.CATEGORIES.CategorieDAO" %>
<%@ page import="Database.Db" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DB.CATEGORIES.Categorie" %>
<%@ page import="java.sql.SQLException" %>
<html>
<head>
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


<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link" href="create-category.jsp">Admin</a>--%>
<%--                </li>--%>


            </ul>

        </div>
    </nav>

</head>


<body>
<div class="container">
    <div class="row">
        <%

            CategorieDAO categorieDAO = null;
            try {
                categorieDAO = new CategorieDAO(new Db().getCon());
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            ArrayList<Categorie> list = categorieDAO.getAll();
            for (int i = 0; i < list.size(); i++) {
        %>
        <div class="col-md-3">
            <div class="card" style="width: 18rem;border: black solid 2px; margin-top: 10px">
                <div class="card-body">
                    <h5 class="card-title"><%=list.get(i).getName()%>
                    </h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                        card's content.</p>
                    <a href="category.jsp?id=<%=categorieDAO.getID(list.get(i).getName())%>" class="btn btn-primary">Go
                        somewhere</a>
                </div>
            </div>
        </div>

        <%}%>
    </div>
</div>

</body>
</html>