<%@ page import="com.supernotes.dao.UserDAO" %>
<%@ page import="com.supernotes.model.Content" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%	response.setHeader("cache-control", "no-cache,no-store,must-revalidate");
	UserDetails user2=(UserDetails)session.getAttribute("userlogin");
	if(user2==null)
	{
		response.sendRedirect("login.jsp");
		session.setAttribute("no-login","Please login to continue...");
	}	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit your Notes - SuperNotes</title>
<%@include file="all_components/all_design.jsp" %>
</head>
<body>
<%
	int noteid=Integer.parseInt(request.getParameter("note_id"));
	Content cont=UserDAO.getDataById(noteid);
%>
<div class="container-fluid p-0">
	<%@include file="all_components/navbar.jsp" %>
	<h1 class="text-center">Edit Your Notes</h1>
	<div class="container">
			<div class="row">
				<div class="col-md-12">
					
					<form action="edit" method="post">
					  <input type="hidden" value="<%=noteid%>" name="noteid">
					  <div class="form-group">
					  				  	
					    <label for="exampleInputEmail1">Edit Title</label>
					    <input type="text" name="title" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="title" value="<%=cont.getTitle() %>" required>
					  </div>
					  
					  <div class="form-group">
					  	<label for="exampleInputEmail1">Edit Content</label>
					  	<textarea rows="9" cols=" " name="content" class="form-control" placeholder="Type Your Content" required><%=cont.getContent() %></textarea>			  
					  </div>
					  
					  <div class="container text-center">
					  	<button type="submit" class="btn btn-primary">Save Changes</button>
					  </div>
					
					</form>	
				</div>
			</div>
	</div>
</div>
</body>
</html>