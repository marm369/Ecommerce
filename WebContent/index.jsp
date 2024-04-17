<%@page import="connection.DbCon"%>
<%@page import="dao.ProductDao"%>
<%@page import="dao.CategoryDao"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}

ProductDao pd = new ProductDao(DbCon.getConnection());
CategoryDao cd = new CategoryDao(DbCon.getConnection());

Map<Integer,String> categories = cd.getAllCategories(); // Obtenez toutes les catégories distinctes

ProductDao productDao = new ProductDao(DbCon.getConnection());
List<Product> productsWithPromotion = productDao.getProductsByPromotion();
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/head.jsp"%>
<title>TP Ecommerce</title>
</head>
<body>
    <%@include file="/includes/navbar.jsp"%>
    <div class="container">
  <div class="card-header my-3 bg-info text-white">Nos Promotions</div>

    <div class="row" style="overflow-x: auto;">
        <!-- Les produits avec promotion seront ajoutés ici -->
        <div class="d-flex flex-nowrap">
            <% 
                // Insérez ici votre logique pour afficher les produits avec promotion
                for (Product product : productsWithPromotion) {
            %>
                <div class="col-md-3 my-3">
                    <div class="card w-100">
                        <img class="card-img-top" width="80" height="150" src="product-image/<%= product.getImage() %>"
                            alt="image n'existe pas">
                        <div class="card-body">
                            <h5 class="card-title"><%= product.getName() %></h5>
                            <h6 class="price">Prix: <%= product.getPrice() %>DH</h6>
                            <div class="mt-3 d-flex justify-content-between">
                                <a href="ajouter-au-panier?id=<%= product.getId() %>">Ajouter Au Panier</a>
                            </div>
                        </div>
                    </div>
                </div>
            <% 
                }
            %>
        </div>
    </div>
 
        <%
        for (Map.Entry<Integer, String> entry : categories.entrySet()) {
            int categoryId = entry.getKey();
            String categoryName = entry.getValue();

            out.println("<div class=\"card-header my-3 bg-info text-white\">" + categoryName + "</div>");



            List<Product> productsByCategory = pd.getProductsByCategoryId(categoryId);
            if (!productsByCategory.isEmpty()) {
                out.println("<div class=\"row\">");
                for (Product p : productsByCategory) {
           %>
                    <div class="col-md-3 my-3">
                        <div class="card w-100">
                            <img class="card-img-top" width="80" height="150" src="product-image/<%=p.getImage() %>"
                                alt="image n'existe pas">
                            <div class="card-body">
                                <h5 class="card-title"><%=p.getName() %></h5>
                                <h6 class="price">Prix: <%=p.getPrice() %>DH</h6>
                                <div class="mt-3 d-flex justify-content-between">
                             
                                    <a  href="add-to-cart?id=<%=p.getId()%>">Ajouter Au Panier</a>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
         <%
                }
                out.println("</div>");
            } else {
                out.println("Pas de Produits dans la catégorie " + categoryName);
            }
        }
         %>
    </div>
    <%@include file="/includes/footer.jsp"%>
</body>
</html>
