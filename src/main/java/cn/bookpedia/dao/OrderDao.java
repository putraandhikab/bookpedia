package cn.bookpedia.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cn.bookpedia.dao.BookDao;
import cn.bookpedia.model.Order;
import cn.bookpedia.model.Book;

public class OrderDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public OrderDao(Connection con) {
		this.con = con;
	}
	
	public boolean insertOrder(Order model) {
		boolean result = false;
		
		try {
			
			query = "INSERT INTO orders (id_product, id_user, quantity, date) VALUES (?, ?, ?, ?)";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, model.getId_product());
			pst.setInt(2, model.getId_user());
			pst.setInt(3, model.getQuantity());
			pst.setString(4, model.getDate());
			pst.executeUpdate();
			result = true;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public List<Order> userOrders(int id_product){
		List<Order> list = new ArrayList<>();
		try {
			
			query = "SELECT * FROM orders WHERE id_user=? ORDER BY orders.id_order DESC";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id_product);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				Order order = new Order();
				BookDao bookDao = new BookDao(this.con);
				int idProduct = rs.getInt("id_product");
				
				Book book = bookDao.getSingleProduct(idProduct);
				order.setId_order(rs.getInt("id_order"));
				order.setId_product(id_product);
				order.setProduct_name(book.getProduct_name());
				order.setCategory(book.getCategory());
				order.setPrice(book.getPrice()*rs.getInt("quantity"));
				order.setQuantity(rs.getInt("quantity"));
				order.setDate(rs.getString("date"));
				list.add(order);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void cancelOrder(int id_product) {
		try {
			query = "DELETE FROM orders WHERE id_order=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id_product);
			pst.execute();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
