<nav class="navbar navbar-expand-lg navbar-success bg-success">
	<div class="container">
		<a class="navbar-brand" href="#">BookPedia</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav ml-auto">
				<a class="nav-item nav-link active" href="index.jsp">Home</a>
				<a class="nav-item nav-link mr-2" href="cart.jsp">Cart<span class="badge badge-danger px-1">${ cart_list.size() }</span></a> 
			<%
			if(auth != null){
			%>
				<a class="nav-item nav-link" href="myOrders.jsp">My Orders</a>  
				<a class="btn btn-danger mr-2" href="log-out">Logout</a> 
			<%
			}else{
			%>
				<a class="btn btn-light" href="login.jsp">Login</a>
			<%
			}
			%>
			</div>
		</div>
	</div>
</nav>