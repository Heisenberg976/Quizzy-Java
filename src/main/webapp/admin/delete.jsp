<%@ page import="DB.CATEGORIES.CategorieDAO" %>
<%@ page import="Database.Db" %>
<%@ page import="DB.CATEGORIES.Categorie" %>
<%@ page import="java.sql.SQLException" %>
<%
    String name = request.getParameter("name");
    CategorieDAO categorieDAO = null;
    try {
         categorieDAO = new CategorieDAO(new Db().getCon());
    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }
    Categorie categorie = null;
    try {
        categorie = new Categorie(name);
    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }
    assert categorieDAO != null;
    assert categorie != null;
    categorieDAO.deleteCategorie(categorie);
    request.getRequestDispatcher("create-category.jsp").forward(request,response);
%>