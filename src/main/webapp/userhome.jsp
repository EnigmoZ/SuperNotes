<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home - Welcome to SuperNotes</title>
<%@include file="all_components/all_design.jsp" %>
</head>
<body>
<%
	response.setHeader("cache-control", "no-cache,no-store,must-revalidate");
	UserDetails user1=(UserDetails)session.getAttribute("userlogin");
	if(user1!=null)
	{
%>		<div class="container-fluid p-0">
		<%@include file="all_components/navbar.jsp" %>
			<div class="card py-5">
				<div class="card-body text-center">
					<img src="images/takeN3.jpeg" class="img-fluid mx-auto" style="width: 353px;">
					<h1>Start taking your Notes</h1>
					<a href="addnotes.jsp" class="btn btn-outline-primary">Start Here</a>
				</div>
			</div>
		</div>
<% 	}
	else
	{
		response.sendRedirect("login.jsp");
		session.setAttribute("no-login","Please login to continue...");
	}	
%>
	
</body>
</html>