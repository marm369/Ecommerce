<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.OrderDao"%>
<%@page import="connection.DbCon"%>
<%@page import="dao.ProductDao"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
List<Order> orders = null;
if (auth != null) {
    request.setAttribute("person", auth);
    OrderDao orderDao = new OrderDao(DbCon.getConnection());
    orders = orderDao.userOrders(auth.getId());
} else {
    response.sendRedirect("login.jsp");
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
<title>E-Commerce Cart</title>
<script>
    function confirmOrder(orderId) {
        var name = prompt("Entrez votre nom :");
        var firstName = prompt("Entrez votre prénom :");
        var address = prompt("Entrez votre adresse :");

        if (name && firstName && address) {
            // Envoyer les informations au serveur pour traiter la commande
        

            // Désactiver les boutons "Confirmer Commande" et "Annuler Commande"
            document.getElementById("confirmOrderButton_" + orderId).disabled = true;
            document.getElementById("cancelOrderButton_" + orderId).disabled = true;

            // Modifier le statut de la commande
            var status = document.getElementById("status_" + orderId);
            status.innerHTML = "Status: Confirmée";
        }
    }

    function disableButtons(orderId) {
        // Désactiver les boutons "Confirmer Commande" et "Annuler Commande" si le statut est confirmé (1)
        var status = document.getElementById("status_" + orderId);
        if (status.innerHTML.includes("Confirmée")) {
            document.getElementById("confirmOrderButton_" + orderId).disabled = true;
            document.getElementById("cancelOrderButton_" + orderId).disabled = true;
        }
    }
</script>
</head>
<body onload="disableButtons()">
<%@include file="/includes/navbar.jsp"%>
<div class="container">
    <div class="card-header my-3">Commandes</div>
    <table class="table table-light">
        <thead>
        <tr>
            <th scope="col">Date</th>
            <th scope="col">Nom</th>
            <th scope="col">Quantité</th>
            <th scope="col">Prix</th>
            <th scope="col">Statut</th>
            <th scope="col">Annuler</th>
            <th scope="col">Confirmer</th>
        </tr>
        </thead>
        <tbody>
        <%
        if (orders != null) {
            for (Order o : orders) {
        %>
        <tr>
            <td><%=o.getDate() %></td>
            <td><%=o.getName() %></td>
            <td><%=o.getQunatity() %></td>
            <td><%=dcf.format(o.getPrice()) %></td>
            <td id="status_<%=o.getOrderId()%>">Status: <%= o.getStatus() == 1 ? "Confirmée" : "En attente" %></td>
             <td>
                <button id="confirmOrderButton_<%=o.getOrderId()%>"
                        class="btn btn-sm btn-success"
                        onclick="confirmOrder(<%=o.getOrderId()%>)"
                        <%= o.getStatus() == 1 ? "disabled" : "" %>>
                    Confirmer Commande
                </button>
            </td>
            <td>
             <a id="cancelOrderButton_<%=o.getOrderId()%>"
               class="btn btn-sm btn-danger"
               href="cancel-order?id=<%=o.getOrderId()%>"
               <%= o.getStatus() == 1 ? "disabled" : "" %>>
               Annuler Commande
               </a>

            </td>
           
        </tr>
        <%
            }
        }
        %>
        </tbody>
    </table>
</div>
<%@include file="/includes/footer.jsp"%>
</body>
</html>
