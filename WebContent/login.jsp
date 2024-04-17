<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        response.sendRedirect("index.jsp");
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/includes/head.jsp"%>
    <title>E-Commerce TP</title>
    <!-- Utilisation de Bootstrap pour le style -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Ajout de style personnalisé -->
    <style>
        body {
            background-color: #f8f9fa;
        }

        .card {
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }

        .card-header {
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
            text-align: center;
            border-radius: 10px 10px 0 0;
        }

        .card-body {
            padding: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            width: 100%;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        .login-link {
            color: #007bff;
            text-decoration: none;
        }

        .login-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<%@include file="/includes/navbar.jsp"%>

<div class="container">
    <div class="card mx-auto">
        <div class="card-header">Se Connecter</div>
        <div class="card-body">
            <form action="user-login" method="post">
                <div class="form-group">
                    <label>Adresse Email</label>
                    <input type="email" name="login-email" class="form-control" placeholder="Entrer votre Email" required>
                </div>
                <div class="form-group">
                    <label>Mot de Passe</label>
                    <input type="password" name="login-password" class="form-control" placeholder="Entrer votre Mot de Passe" required>
                </div>
                <button type="submit" class="btn btn-primary">Login</button>
            </form>
            <%
    String errorMessage = (String) request.getAttribute("errorMessage");
    if (errorMessage != null && !errorMessage.isEmpty()) {
%>
    <div id="errorMessage" class="alert alert-danger">
        <%= errorMessage %>
    </div>
<%
    }
%>
            
          <div id="errorMessage" class="alert alert-danger" style="display:none;"></div>

        </div>
    </div>
</div>

<%@include file="/includes/footer.jsp"%>
<!-- Utilisation de Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
