<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%	response.setHeader("cache-control", "no-cache,no-store,must-revalidate");
	UserDetails user1=(UserDetails)session.getAttribute("userlogin");
	if(user1==null)
	{
		response.sendRedirect("login.jsp");
		session.setAttribute("no-login","Please login to continue...");
	}	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AddNotes - SuperNotes</title>
<%@include file="all_components/all_design.jsp" %>
</head>
<body>
<div class="container-fluid p-0">
	<%@include file="all_components/navbar.jsp" %>
	<h1 class="text-center">Add Your Notes</h1>
	<div class="container">
			<div class="row">
				<div class="col-md-12">
					
					<form action="addnotes" method="post">
					  <div class="form-group">
					  	<%
					  		UserDetails us=(UserDetails)session.getAttribute("userlogin");
					  		if(us!=null)
					  		{%>
					  			<input type="hidden" value="<%=us.getId() %>" name="uid">
					  	<%	}
					  	%>
					  	
					    <label for="exampleInputEmail1">Enter Title</label>
					    <input type="text" name="title" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="title" required>
					  </div>
					  
					  <div class="form-group">
					  	<label for="exampleInputEmail1">Enter Content</label>
					  	<textarea rows="9" cols=" " name="content" class="form-control" placeholder="Type Your Content" required></textarea>			  
					  </div>
					  
					  <div class="container text-center">
					  	<button type="submit" class="btn btn-primary">Add Notes</button>
					  </div>
					
					</form>	
				</div>
			</div>
	</div>
</div>
</body>
</html>