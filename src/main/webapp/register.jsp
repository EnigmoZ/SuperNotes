<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
	.div-colour{
		background-image: linear-gradient(to right top, #12eb83, #00dcdd, #00c1ff, #0091ff, #ce12eb);
		height: 89.1vh;
	}
</style>
<title>Register - SuperNotes</title>
<%@include file="all_components/all_design.jsp" %>
</head>
<body>
	<%@include file="all_components/navbar.jsp" %>
	<div class="container-fluid div-colour">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">
					<div class="card-header text-center text-white bg-custom">
						<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
						<h4>Registration</h4>
					</div>
					<div class="card-body">
						<form action="UserServlet" method="post">
						
						  <%
						  	String regmsg=(String)session.getAttribute("reg-success");
						  	if(regmsg!=null){
						  %>
						  	<div class="alert alert-success" role="alert"><%=regmsg%> Login<a href="login.jsp"> Click Here</a></div>
						  <%
						  	session.removeAttribute("reg-success");
						  	}
						  %>
						  
						  <%	
						  	String failedmsg=(String)session.getAttribute("failed-msg");
						  	if(failedmsg!=null){
						  %>	
						  	<div class="alert alert-danger" role="alert"><%=failedmsg%></div>
						  <%
						  session.removeAttribute("failed-msg");
						  	}
						  %>	
						  <div class="form-group">
						    <label for="exampleInputEmail1">Enter Full Name</label>
						    <input type="text" name="fullname" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Full Name">
						  </div>
						  <div class="form-group">
						    <label for="exampleInputEmail1">Enter Email address</label>
						    <input type="email" name="username" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Email">
						  </div>
						  <div class="form-group">
						    <label for="exampleInputPassword1">Enter Password</label>
						    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
						  </div>
						  <button type="submit" class="btn btn-primary badge-pill btn-block">Register</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>