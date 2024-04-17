package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.ProductDao;
import model.Product;
import connection.DbCon;
@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer les données du formulaire
        String productName = request.getParameter("productName");
        double productPrice = Double.parseDouble(request.getParameter("productPrice"));
        int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));
        int productCategory = Integer.parseInt(request.getParameter("productCategory"));
        
        // Créer un objet Product avec les données récupérées
        Product product = new Product();
        product.setName(productName);
        product.setPrice(productPrice);
        product.setQuantity(productQuantity);
        product.setCategoryId(productCategory);
        product.setImage(null);
        // Ajouter le produit à la base de données
        ProductDao productDao = null;
		try {
			productDao = new ProductDao(DbCon.getConnection());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        productDao.addProduct(product);
        
        // Rediriger vers une page appropriée
        response.sendRedirect("index.jsp"); // Rediriger vers la page d'accueil, par exemple
    }
}
