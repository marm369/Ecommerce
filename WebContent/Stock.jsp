<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.OrderDao"%>
<%@ page import="dao.CategoryDao" %>
<%@page import="connection.DbCon"%>
<%@page import="dao.ProductDao"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth == null) {
		response.sendRedirect("login.jsp");
	}
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
	
	%>
	<% 
  
   
    // Création d'une instance de CategoryDao
    CategoryDao categoryDao = new CategoryDao(DbCon.getConnection());
    
    // Récupération de toutes les catégories depuis la base de données
    Map<Integer, String> categories = categoryDao.getAllCategories();
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file="/includes/head.jsp"%>
    <title>Gestion des produits</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }
        h1, h2 {
            text-align: center;
            margin-top: 20px;
        }
        form {
            width: 50%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
   <%@include file="/includes/navbar.jsp"%>
    <h1>Gestion des produits</h1>
    <form action="AddProductServlet" method="post">
        <h2>Ajouter un produit</h2>
        <label for="productName">Nom du produit:</label>
        <input type="text" id="productName" name="productName">

        <label for="productPrice">Prix du produit:</label>
        <input type="number" id="productPrice" name="productPrice">

        <label for="productQuantity">Quantité du produit:</label>
        <input type="number" id="productQuantity" name="productQuantity">

        <label for="productCategory">Catégorie du produit:</label>
        <select id="productCategory" name="productCategory">
            <% for(Map.Entry<Integer, String> entry : categories.entrySet()) { %>
                <option value="<%= entry.getKey() %>"><%= entry.getValue() %></option>
            <% } %>
        </select>
        <input type="submit" value="Ajouter">
    </form>

    <form action="DeleteProductServlet" method="post">
        <h2>Supprimer un produit</h2>
        <label for="productId">ID du produit à supprimer:</label>
        <input type="text" id="productId" name="productId">

        <input type="submit" value="Supprimer">
    </form>

    <form action="UpdateProductServlet" method="post">
        <h2>Modifier un produit</h2>
        <label for="productIdToUpdate">ID du produit à modifier:</label>
        <input type="text" id="productIdToUpdate" name="productIdToUpdate">

        <label for="newProductName">Nouveau nom du produit:</label>
        <input type="text" id="newProductName" name="newProductName">

        <label for="newProductPrice">Nouveau prix du produit:</label>
        <input type="number" id="newProductPrice" name="newProductPrice">

        <label for="newProductQuantity">Nouvelle quantité du produit:</label>
        <input type="number" id="newProductQuantity" name="newProductQuantity">

        <label for="newProductCategory">Nouvelle catégorie du produit:</label>
        <select id="newProductCategory" name="newProductCategory">
           <% for(Map.Entry<Integer, String> entry : categories.entrySet()) { %>
                <option value="<%= entry.getKey() %>"><%= entry.getValue() %></option>
            <% } %>
        </select>

        <input type="submit" value="Modifier">
    </form>

    <form action="AddCategoryServlet" method="post">
        <h2>Ajouter une catégorie</h2>
        <label for="categoryName">Nom de la catégorie:</label>
        <input type="text" id="categoryName" name="categoryName">

        <input type="submit" value="Ajouter">
    </form>
</body>
</html>
