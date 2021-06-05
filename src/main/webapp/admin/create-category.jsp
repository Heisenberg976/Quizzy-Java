<%@ page import="DB.CATEGORIES.CategorieDAO" %>
<%@ page import="Database.Db" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Array" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DB.CATEGORIES.Categorie" %>
<%@ page import="java.util.Objects" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<body>

<?php include 'navbar.php' ?>
<div class="list-group" style="float:left;margin-top:20px; width:200px">

    <a href="create-category.jsp" class="list-group-item list-group-item-action active">Categories</a>
    <a href="create-question.jsp" class="list-group-item list-group-item-action">Question</a>
    <a href="../index.jsp" class="list-group-item list-group-item-action">User</a>
    <a href="/logout" class="list-group-item list-group-item-action ">Sign out</a>

</div>

<div class="container">
    <a href="add.jsp" class="btn btn-primary" style="margin-top:20px;width:80px">Add</a>

    <div class="row">
        <%
            ArrayList<Categorie> arr = null;
            CategorieDAO categorieDAO = null;
            try {
                categorieDAO = new CategorieDAO(new Db().getCon());
                arr = categorieDAO.getAll();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            for (int i = 0; i < Objects.requireNonNull(arr).size(); i++) {
                Categorie categorie  = arr.get(i);

        %>
        <div class="col-md-3" style="margin-left:10%;">
            <div class="card" style="margin-bottom:15px;width:18rem;">
                <div class="card-body">
                    <h5 class="card-title"><%=categorie.getName()%></h5>
                    <a href="edit.jsp?name=<%=categorie.getName()%>" class="btn btn-primary">Edit</a>
                    <a href="delete.jsp?name=<%=categorie.getName()%>" class="btn btn-danger" style="margin-left:15px">Delete</a>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>
</div>

</body>
</html>