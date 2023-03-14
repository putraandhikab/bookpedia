<%@page import="cn.bookpedia.model.*"%>
<%@page import="cn.bookpedia.dao.*"%>
<%@page import="cn.bookpedia.connection.DbCon"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
List<Order> orders = null;
if (auth != null) {
	request.setAttribute("auth", auth);
	orders = new OrderDao(DbCon.getConnection()).userOrders(auth.getId_user());
} else if (auth == null) {
	response.sendRedirect("login.jsp");
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	BookDao bDao = new BookDao(DbCon.getConnection());
	cartProduct = bDao.getCartProducts(cart_list);
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="includes/head.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	
	<div class="container mt-4">
		<div class="card-header">All Orders</div>
		
		<table class="table mt-3">
		  <thead>
		    <tr>
		      <th scope="col">Date</th>
		      <th scope="col">Book</th>
		      <th scope="col">Category</th>
		      <th scope="col">Quantity</th>
		      <th scope="col">Price</th>
		      <th scope="col">Action</th>
		    </tr>
		  </thead>
		  <tbody>
		    <%
			if(orders != null){
				for(Order o:orders){%>
				<tr>
					<td><%=o.getDate() %></td>
					<td><%=o.getProduct_name() %></td>
					<td><%=o.getCategory() %></td>
					<td><%=o.getQuantity() %></td>
					<td><%=dcf.format(o.getPrice()) %></td>
					<td><a class="btn btn-sm btn-danger" href="Cancel-order?id_product=<%=o.getId_order()%>">Cancel Order</a></td>
				</tr>
			<%}
			}
			%>
		  </tbody>
		</table>
	</div>
	
	<%@include file="includes/footer.jsp"%>
</body>
</html>