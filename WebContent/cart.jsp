<%@page import="connection.DbCon"%>
<%@page import="dao.ProductDao"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	ProductDao pDao = new ProductDao(DbCon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/head.jsp"%>
<title>E-Commerce Cart</title>
<style type="text/css">

.table tbody td{
vertical-align: middle;
}
.btn-incre, .btn-decre{
box-shadow: none;
font-size: 25px;
}
</style>
</head>
<body>
	<%@include file="/includes/navbar.jsp"%>

	<div class="container my-3">
	
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Nom</th>
					
					<th scope="col">Prix</th>
					<th scope="col">Quantite</th>
				
					<th scope="col">Annuler</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (cart_list != null) {
					for (Cart c : cartProduct) {
				%>
				<tr>
					<td><%=c.getName()%></td>
				
					<td><%= dcf.format(c.getPrice())%></td>
					<td>
						<form action="order-now" method="post" class="form-inline">
						<input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
							<div class="form-group">
    <div class="input-group">
        <div class="input-group-prepend">
            <a class="btn btn-primary" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"><i class="fas fa-minus"></i></a>
        </div>
        <input type="text" name="quantity" class="form-control text-center" value="<%=c.getQuantity()%>" readonly>
        <div class="input-group-append">
            <a class="btn btn-primary" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"><i class="fas fa-plus"></i></a>
        </div>
    </div>
</div>
							
						</form>
					</td>
					<td><a href="remove-from-cart?id=<%=c.getId() %>" class="btn btn-sm btn-danger">Annuler</a></td>
				</tr>

				<%
				}}%>
			</tbody>
		</table>
	</div>
		<div class="d-flex py-3" style="margin-left: 300px;"><h3>Prix Total:  ${(total>0)?dcf.format(total):0}DH </h3> <a class="mx-3 btn btn-danger" href="cart-check-out">Finaliser Achat</a></div>

	<%@include file="/includes/footer.jsp"%>
</body>
</html>