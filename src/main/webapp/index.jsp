<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style type="text/css">
	.back-img{
		background: url("images/bg-notes3.jpg");
		background-position: center;
    	background-size: cover;
    	position: relative;
		width: 100%;
		height: 89.2vh;
    }
    
    .back-img .text-center .text{
    	font-size: 50px;
    	color: #3e2723;
    }
    
    .back-img .text-center .btn{
    	margin-right: 4px;
    }
    
    .back-img .text-center .btn:hover{
    	background: #ffe082;
    	color: #3e2723;
    	transition: 0.3s;
    }
</style>
<title>SuperNotes - For Super Notes Makers</title>
<%@include file="all_components/all_design.jsp" %>
</head>
<body>
	<%@include file="all_components/navbar.jsp" %>
	<div class="container-fluid back-img">
		<div class="text-center">
			<h1 class="text">
				<br><br>Welcome to <b><u>SuperNotes</u></b>, <br>Your digital haven for organized & <br> efficient note-taking!<br>
			</h1>
			<a href="login.jsp" class="btn btn-light" type="submit"><i class="fa fa-sign-in" aria-hidden="true"></i> Login</a>
    		<a href="register.jsp" class="btn btn-light" type="submit"><i class="fa fa-user-plus" aria-hidden="true"></i> Register</a>
		</div>
	</div>
</body>
</html>