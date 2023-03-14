<%@page import="java.util.*"%>
<%@page import="cn.bookpedia.connection.DbCon"%>
<%@page import="cn.bookpedia.dao.*"%>
<%@page import="cn.bookpedia.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%

User auth = (User) request.getSession().getAttribute("auth");
if(auth != null) {
	request.setAttribute("auth", auth);
}
//else {
//	response.sendRedirect("login.jsp");
//}

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if(cart_list != null){
	request.setAttribute("cart_list", cart_list);
}

BookDao bd = new BookDao(DbCon.getConnection());
List<Book> book = bd.getAllProducts();

%>
<!DOCTYPE html>
<html>
<head>
<%@include file="includes/head.jsp"%>
<title>Home</title>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>

	<div class="container mt-4">
		<div class="card-header">All Books</div>
		<div class="row">
		<%
			if(!book.isEmpty()){
				for(Book b:book){
					
			
		%>
			<div class="col-md-3 my-3 mr-5">
				<div class="card mt-4" style="width: 18rem;">
					<img class="card-img-top" src="img/<%= b.getImage() %>"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%= b.getProduct_name() %></h5>
							<h6 class="price">Price: $<%= b.getPrice() %></h6>
							<h6 class="category">Category: <%= b.getCategory() %></h6>
							<div class="mt-3 d-flex justify-content-between">
								<a href="Add-to-cart?id_product=<%= b.getId_product() %>" class="btn btn-dark">Add to Cart</a>
								<a href="Order-now?quantity=1&id_product=<%= b.getId_product() %>" class="btn btn-primary">Buy Now</a>
							</div>
					</div>
				</div>
			</div>
			<%
				}
			}
			%>
		</div>
	</div>


	<%@include file="includes/footer.jsp"%>
</body>
</html>