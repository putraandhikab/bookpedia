<%@page import="cn.bookpedia.model.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if(auth != null){
	request.setAttribute("auth", auth);
	response.sendRedirect("index.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="includes/head.jsp"%>
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Login</title>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	
	<div class="card mt-5 mx-auto" style="width: 30rem; height: 25rem;">
		<div class="container mt-5">
		<center>
		<h1>Login</h1>
		</center>
		<form action="login" method="post">
		  <div class="form-group">
		    <label for="exampleInputEmail1">Username</label>
		    <input type="text" name="username" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter username">
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPassword1">Password</label>
		    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
		  </div>
		  <button type="submit" class="btn btn-primary">Submit</button>
		</form>
		</div>
	</div>
	
	<%@include file="includes/footer.jsp"%>
</body>
</html>