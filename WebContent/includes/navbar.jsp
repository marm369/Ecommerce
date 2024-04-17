<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
    <img src="product-image/ecommerce.jpg" alt="Logo" width="30" height="30" class="d-inline-block align-top" style="margin-right: 10px;"></img>
        <a class="navbar-brand" href="index.jsp">E-Commerce TP</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="index.jsp" color="white">Page Principale</a></li>
                <li class="nav-item"><a class="nav-link" href="cart.jsp" color="white" >Panier </a></li>
                <% if (auth != null) { %>
                
                    <li class="nav-item"><a class="nav-link" href="orders.jsp" color="white" >Commandes</a></li>
                    <li class="nav-item"><a class="nav-link" href="log-out" color="white">Deconnexion</a></li>
                <% } else { %>
                    <li class="nav-item"><a class="nav-link" href="login.jsp" color="white">Se Connecter</a></li>
                    <li class="nav-item"><a class="nav-link" href="Stock.jsp" color="white">Stock</a></li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>
