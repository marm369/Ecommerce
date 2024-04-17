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
@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer l'ID du produit à supprimer depuis le formulaire
        int productIdToDelete = Integer.parseInt(request.getParameter("productId"));
        
        // Supprimer le produit de la base de données
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
        productDao.deleteProduct(productIdToDelete);
        
        // Rediriger vers une page appropriée
        response.sendRedirect("index.jsp"); // Rediriger vers la page d'accueil, par exemple
    }
}
