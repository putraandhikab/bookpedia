package cn.bookpedia.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import cn.bookpedia.model.Cart;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/Add-to-cart")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out = response.getWriter()){
			ArrayList<Cart> cartList = new ArrayList<>();
			
			int id_product = Integer.parseInt(request.getParameter("id_product"));
			Cart cm = new Cart();
			cm.setId_product(id_product);
			cm.setQuantity(1);
			
			HttpSession session = request.getSession(); //dibuat dulu variable biar bisa digunakan untuk melakukan operasi lain terhadap session seperti mengatur waktu kadaluwarsa, menyimpan atribut lain, atau menghapus session.
			ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
			
			//kalo pake kode dibawah ini, itu hanya mengambil atribut "cart-list" dari objek session. makannya gaakan jalan jumlah cartnya
			//ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			
			if(cart_list == null) {
				cartList.add(cm);
				session.setAttribute("cart-list", cartList);
				response.sendRedirect("index.jsp");
			}else {
				cartList = cart_list;
				boolean exist = false;
				
				for(Cart c:cartList) {
					if(c.getId_product() == id_product) {
						exist = true;
						out.println("<h3 style='color:crimson; text-align:center'>Item already exist in Cart.<a href='cart.jsp'>Go to Cart Page</a></h3>");
					}
				}
				if(!exist) {
					cartList.add(cm);
					response.sendRedirect("index.jsp");
				}
			}
		}
	}
}
