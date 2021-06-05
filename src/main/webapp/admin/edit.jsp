<html>
<%@ page import="DB.CATEGORIES.Categorie" %>
<%@ page import="DB.CATEGORIES.CategorieDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="Database.Db" %>
<%
    if(request.getParameter("v") != null){
    Categorie categorie = null;
    CategorieDAO categorieDAO = null;
    try {
        categorieDAO = new CategorieDAO(new Db().getCon());
        categorie = new Categorie(request.getParameter("oldName"));
    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }
    assert categorieDAO != null;
    assert categorie != null;
    categorieDAO.edit(categorie, request.getParameter("name"));
    request.getRequestDispatcher("create-category.jsp").forward(request, response);
    }
    else
%>


<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-4">
            <form action="edit.jsp?v=1" method="post" style="margin-top:20px">
                <div class="form-group">
                    <label>Name</label>
                    <input type="text" class="form-control" name="name" value="<%=request.getParameter("name")%>">
                    <input type="hidden" class="form-control" name="oldName" value="<%=request.getParameter("name")%>">
                </div>
                  <br>
                <input type="submit" name="submit" class="btn btn-success">
            </form>
        </div>
    </div>
</div>
</body>
</html>