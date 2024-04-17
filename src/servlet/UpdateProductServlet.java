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
@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer les données du formulaire
        int productIdToUpdate = Integer.parseInt(request.getParameter("productIdToUpdate"));
        String newProductName = request.getParameter("newProductName");
        double newProductPrice = Double.parseDouble(request.getParameter("newProductPrice"));
        int newProductQuantity = Integer.parseInt(request.getParameter("newProductQuantity"));
        int newProductCategory = Integer.parseInt(request.getParameter("newProductCategory"));
        
        // Créer un objet Product avec les données mises à jour
        Product updatedProduct = new Product();
        updatedProduct.setId(productIdToUpdate);
        updatedProduct.setName(newProductName);
        updatedProduct.setPrice(newProductPrice);
        updatedProduct.setQuantity(newProductQuantity);
        updatedProduct.setCategoryId(newProductCategory);
        
        // Mettre à jour le produit dans la base de données
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
        productDao.updateProduct(updatedProduct);
        
        // Rediriger vers une page appropriée
        response.sendRedirect("index.jsp"); // Rediriger vers la page d'accueil, par exemple
    }
}
