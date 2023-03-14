package cn.bookpedia.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cn.bookpedia.model.Book;
import cn.bookpedia.model.Cart;

public class BookDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public BookDao(Connection con) {
		this.con = con;
	}
	
	public List<Book> getAllProducts(){
		List<Book> book = new ArrayList<Book>();
		
		try {
			query = "SELECT * FROM products";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
			while(rs.next()) {
				Book row = new Book();
				row.setId_product(rs.getInt("id_product"));
				row.setProduct_name(rs.getString("product_name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				
				book.add(row);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return book;
	}
	
	public List<Cart> getCartProducts(ArrayList<Cart> cartList){
		List<Cart> products = new ArrayList<Cart>();
		
		try {
			if(cartList.size() > 0) {
				for(Cart item:cartList) {
					query = "SELECT * FROM products WHERE id_product=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId_product());
					rs = pst.executeQuery();
					while(rs.next()) {
						Cart row = new Cart();
						row.setId_product(rs.getInt("id_product"));
						row.setProduct_name(rs.getString("product_name"));
						row.setCategory(rs.getString("category"));
						row.setPrice(rs.getDouble("price")*item.getQuantity());
						row.setQuantity(item.getQuantity());
						products.add(row);
					}
				}
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		return products;
	}
	
	public Book getSingleProduct(int id_product) {
		Book row = null;
		
		try {
			
			query = "SELECT * FROM products WHERE id_product=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id_product);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				row = new Book();
				row.setId_product(rs.getInt("id_product"));
				row.setProduct_name(rs.getString("product_name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return row;
	}
	
	public double getTotalCartPrice(ArrayList<Cart> cartList) {
		double sum = 0;
		
		try {
			if(cartList.size() > 0) {
				for(Cart item:cartList) {
					query = "SELECT price FROM products WHERE id_product = ?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId_product());
					rs = pst.executeQuery();
					
					while(rs.next()) {
						sum += rs.getDouble("price")*item.getQuantity();
					}
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return sum;
	}

}
