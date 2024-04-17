package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.DbCon;
import dao.OrderDao;
import model.*;

@WebServlet("/cart-check-out")
public class CheckOutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
        User auth = (User) request.getSession().getAttribute("auth");
        if (cart_list != null && auth != null) {
            try {
                OrderDao oDao = new OrderDao(DbCon.getConnection());
                for (Cart c : cart_list) {
                    Order order = new Order();
                    order.setId(c.getId());
                    order.setUid(auth.getId());
                    order.setQunatity(c.getQuantity());
                    order.setDate(formatter.format(date));
                    boolean result = oDao.insertOrder(order);
                    if (!result) {
                        break;
                    }
                }
                cart_list.clear();
                response.sendRedirect("orders.jsp");
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                // Gérer les exceptions
            }
        } else {
            if (auth == null) {
                response.sendRedirect("login.jsp");
            } else {
                response.sendRedirect("cart.jsp");
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}
