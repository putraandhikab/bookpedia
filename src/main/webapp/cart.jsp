<%@page import="cn.bookpedia.model.*"%>
<%@page import="cn.bookpedia.dao.*"%>
<%@page import="cn.bookpedia.connection.DbCon"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if(cart_list != null){
	BookDao bDao = new BookDao(DbCon.getConnection());
	cartProduct = bDao.getCartProducts(cart_list);
	double total = bDao.getTotalCartPrice(cart_list);
	request.setAttribute("cart_list", cart_list);
	request.setAttribute("total", total);
}
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="includes/head.jsp"%>
<title>Cart</title>
</head>
<body>

	<%@include file="includes/navbar.jsp"%>

	<div class="container mt-4">
		<h3 class="d-inline">Total Price : $ ${ (total > 0)?dcf.format(total):0 }</h3>
		<a href="Check-out" class="btn btn-primary mx-3">Check Out</a>
		
		<table class="table mt-3">
		  <thead>
		    <tr>
		      <th scope="col">Book</th>
		      <th scope="col">Category</th>
		      <th scope="col">Price</th>
		      <th scope="col">Quantity</th>
		      <th scope="col">Action</th>
		    </tr>
		  </thead>
		  <tbody>
		    <%
		    	if(cart_list != null){
					for(Cart c:cartProduct){
		    %>
		      <tr>
							<td><%= c.getProduct_name() %></td>
							<td><%= c.getCategory() %></td>
							<td><%= dcf.format(c.getPrice()) %></td>
							<td>
								<form action="order-now" method="post" class="form-inline">
									<input type="hidden" name="id" value="<%= c.getId_product() %>" class="form-input">
									<div class="form-group d-flex justify-content-between w-50">
										<a class="btn btn-sm btn-decre" href="Quantity-inc-dec?action=dec&id_product=<%= c.getId_product() %>"><i class="fas fa-minus-square"></i></a>
										<input type="text" name="quantity" class="form-control w-50" value="<%= c.getQuantity() %>" readonly>
										<a class="btn btn-sm btn-incre" href="Quantity-inc-dec?action=inc&id_product=<%= c.getId_product() %>"><i class="fas fa-plus-square"></i></a>
									</div>
									<button type="submit" class="btn btn-primary btn-sm">Buy</button>
								</form>
							</td>
							<td><a class="btn btn-sm btn-danger" href="Remove-from-cart?id_product=<%= c.getId_product() %>">Remove</a></td>
						</tr>
				<%
						}
					}
				%>
		  </tbody>
		</table>
	</div>

	<%@include file="includes/footer.jsp"%>
</body>
</html>