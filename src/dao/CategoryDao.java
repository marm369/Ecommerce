package dao;

import java.sql.*;
import java.util.*;

import model.Cart;
import model.Product;

public class CategoryDao {
	private Connection con;

	private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    

	public CategoryDao(Connection con) {
		super();
		this.con = con;
	}
	  public Map<Integer, String> getAllCategories() {
	        Map<Integer, String> categories = new HashMap<>();
	        String query = "SELECT id, nom FROM category";
	        try (PreparedStatement statement = con.prepareStatement(query);
	             ResultSet resultSet = statement.executeQuery()) {
	            while (resultSet.next()) {
	                int categoryId = resultSet.getInt("id");
	                String categoryName = resultSet.getString("nom");
	                categories.put(categoryId, categoryName);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return categories;
	    }
	  public boolean addCategory(String categoryName) {
	        String query = "INSERT INTO category (nom) VALUES (?)";
	        try (PreparedStatement pst = con.prepareStatement(query)) {
	            pst.setString(1, categoryName);
	            return pst.executeUpdate() > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	    }
	
	
}
	
