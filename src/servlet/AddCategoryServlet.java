package servlet;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.CategoryDao;
import connection.DbCon;


@WebServlet("/AddCategoryServlet")
public class AddCategoryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer le nom de la catégorie depuis le formulaire
        String categoryName = request.getParameter("categoryName");
        
        // Ajouter la catégorie à la base de données
        CategoryDao categoryDao = null;
		try {
			categoryDao = new CategoryDao(DbCon.getConnection());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        categoryDao.addCategory(categoryName);
        
        // Rediriger vers une page appropriée
        response.sendRedirect("index.jsp"); // Rediriger vers la page d'accueil, par exemple
    }
}
