 package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.DbCon;
import dao.*;
import model.*;

@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String email = request.getParameter("login-email");
			String password = request.getParameter("login-password");

			UserDao udao = new UserDao(DbCon.getConnection());
			User user = udao.userLogin(email, password);
			if (user != null) {
				if(user.getId()==2)
				{
					request.getSession().setAttribute("auth", user);
					response.sendRedirect("Stock.jsp");
				}
				else
				{
				request.getSession().setAttribute("auth", user);
//				System.out.print("user logged in");
				response.sendRedirect("index.jsp");
				}
			} else {
				    request.setAttribute("errorMessage", "Login ou mot de passe incorrect");
				    request.getRequestDispatcher("login.jsp").forward(request, response);
				}
			

		} catch (ClassNotFoundException|SQLException e) {
			e.printStackTrace();
		} 

	}
}
