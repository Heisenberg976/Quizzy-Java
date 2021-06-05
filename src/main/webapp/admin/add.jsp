<%@ page import="DB.CATEGORIES.Categorie" %>
<%@ page import="DB.CATEGORIES.CategorieDAO" %>
<%@ page import="Database.Db" %>
<%@ page import="java.sql.SQLException" %>
                <%-- update data--%>
    <%
        if(request.getParameter("v") != null){
            Categorie categorie = null;
            CategorieDAO categorieDAO = null;
            try {
                categorieDAO = new CategorieDAO(new Db().getCon());
                categorie = new Categorie(request.getParameter("name"));
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            assert categorieDAO != null;
            assert categorie != null;
           categorieDAO.addCategorie(categorie);
            request.getRequestDispatcher("create-category.jsp").forward(request, response);
        }
        else
    %>


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<div class="list-group" style="float:left;margin-top:20px; width:200px">
    <a href="create-category.jsp" class="list-group-item list-group-item-action active">Categories</a>
    <a href="create-question.jsp" class="list-group-item list-group-item-action">Question</a>
    <a href="../index.jsp" class="list-group-item list-group-item-action">User</a>
    <a href="/logout" class="list-group-item list-group-item-action ">Sign out</a>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-3" style="border: black 2px">
            <form action="add.jsp?v=1" method="post" style="margin-top:20px">
                <div class="form-group">
                    <label>Name</label>
                    <input type="text" class="form-control" name="name">
                </div>
                <br>
                <input type="submit" name="submit" class="btn btn-primary">
            </form>


        </div>
    </div>
</div>