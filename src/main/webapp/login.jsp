<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
	.div-colour{
		background-image: linear-gradient(to bottom, #12b3eb, #00c6ee, #00d6da, #00e3b1, #12eb79);
		height: 89.1vh;
	}
</style>
<title>Login - SuperNotes</title>
<%@include file="all_components/all_design.jsp" %>
</head>
<body>
	<%@include file="all_components/navbar.jsp" %>
	<div class="container-fluid div-colour">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">
					<div class="card-header text-center text-white bg-custom">
						<i class="fa fa-sign-in fa-3x" aria-hidden="true"></i>
						<h4>Login</h4>
					</div>
					
					<%	
						String loginfailed=(String)session.getAttribute("login-failed");
					  	if(loginfailed!=null){
					%>	
					  	<div class="alert alert-danger" role="alert"><%=loginfailed %></div>
					<%
						session.removeAttribute("login-failed");
					    }
					%>	
					
					<%	
						String withoutlogin=(String)session.getAttribute("no-login");
					  	if(withoutlogin!=null){
					%>	
					  	<div class="alert alert-danger" role="alert"><%=withoutlogin %></div>
					<%
						session.removeAttribute("no-login");
					    }
					%>
					
					<%	
						String loutmsg=(String)session.getAttribute("logoutmsg");
					  	if(loutmsg!=null){
					%>	
					  	<div class="alert alert-success" role="alert"><%=loutmsg %></div>
					<%
						session.removeAttribute("logoutmsg");
					    }
					%>
					
					<div class="card-body">
						<form action="login" method="post">
						  <div class="form-group">
						    <label for="exampleInputEmail1">Enter Email Id</label>
						    <input type="email" name="username" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Email">
						  </div>
						  <div class="form-group">
						    <label for="exampleInputPassword1">Enter Password</label>
						    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
						  </div>
						  <button type="submit" class="btn btn-primary badge-pill btn-block">Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>