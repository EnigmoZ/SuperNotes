<%@ page import="com.supernotes.dao.UserDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.supernotes.model.Content" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%	response.setHeader("cache-control", "no-cache,no-store,must-revalidate");
	UserDetails usr1=(UserDetails)session.getAttribute("userlogin");
	if(usr1==null)
	{
		response.sendRedirect("login.jsp");
		session.setAttribute("no-login","Please login to continue...");
	}	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Notes - SuperNotes</title>
<%@include file="all_components/all_design.jsp" %>
</head>
<body>
	<%@include file="all_components/navbar.jsp" %>
	<%
	String updatemsg = (String) session.getAttribute("update-msg");
	if (updatemsg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=updatemsg%></div>
	<%
	session.removeAttribute("update-msg");
	}
	%>
	
	<%
	String deletemsg = (String) session.getAttribute("delete-msg");
	if (deletemsg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=deletemsg%></div>
	<%
	session.removeAttribute("delete-msg");
	}
	%>
	<div class="container">
		<h2 class="text-center">All-Notes</h2>
		<div class="row">
			<div class="col-md-12">
				<%
				if (usr1 != null) {
					List<Content> cont = UserDAO.getNotes(usr1.getId());
					for (Content co : cont) {
				%>
				<div class="card mt-3">
					<img alt="" src="images/takeN1.jpeg"
						class="card-img-top mt-2 mx-auto" style="max-width: 150px;">
					<div class="card-body p-4">
						<h5 class="cardt-itle"><%= co.getTitle() %></h5>
						<p><%=co.getContent() %></p>

						<p>
							<b class="text-success">Published By: <%= usr1.getFullname() %></b><b
								class="text-primary"></b>
						</p>

						<p>
							<b class="text-success">Publish Date: <%= co.getDate() %></b><b class="text-primary"></b>
						</p>

						<div class="container text-center mt-2">
							<a href="delete?note_id=<%=co.getId() %>" class="btn btn-danger">Delete</a> 
							<a href="edit.jsp?note_id=<%=co.getId() %>" class="btn btn-success">Edit</a>
						</div>
					</div>
				</div>
				<%
				}
				}
				%>

				
			</div>
		</div>
	</div>
</body>
</html>