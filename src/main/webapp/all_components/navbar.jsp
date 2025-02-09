<%@page import="com.supernotes.model.UserDetails" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom navbar-custom">

	<%
	UserDetails user = (UserDetails) session.getAttribute("userlogin");
	if (user != null) {
	%>
	<a class="navbar-brand" href="userhome.jsp"><i class="fa fa-book" aria-hidden="true"></i> SuperNotes</a>
	<%
	}

	else {
	%>
	<a class="navbar-brand" href="index.jsp"><i class="fa fa-book" aria-hidden="true"></i> SuperNotes</a>
	<%
	}
	%>

  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active mr-3">
        <%
      	if(user!=null){
      	%>
      	<a class="nav-link" href="userhome.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home <span class="sr-only">(current)</span></a>
      	<% 		
      	}
      	
      	else{
     	%>
     	 <a class="nav-link" href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home <span class="sr-only">(current)</span></a>
     	<%	
      	}
      	%>
      </li>
      <li class="nav-item mr-4">
        <a class="nav-link" href="addnotes.jsp"><i class="fa fa-plus-circle" aria-hidden="true"></i> Add Notes</a>
      </li>
      <li class="nav-item mr-auto">
        <a class="nav-link" href="shownotes.jsp"><i class="fa fa-sticky-note" aria-hidden="true"></i> Show Notes</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      
      <%
      	
      	if(user!=null){
      %>
			<a class="btn btn-light my-2 my-sm-0 mr-2 butt" data-toggle="modal" data-target="#exampleModal"
				href="userprofile.jsp" type="submit"><i class="fa fa-user-circle-o" aria-hidden="true"></i> 
				<%=user.getFullname() %></a> 
			
			<a class="btn btn-light my-2 my-sm-0 butt" href="logout"
				type="submit"><i class="fa fa-sign-out" aria-hidden="true"></i>
				Logout</a>
				
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">User Profile</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      	<div class="container text-center">
			      		<i class="fa fa-user fa-5x"></i>
			      		<table class="table">
			      			<tbody>
			      				<tr>
			      					<th>Unique ID</th>
			      					<td>USR<%=user.getId() %></td>
			      				</tr>
			      				<tr>
			      					<th>Name</th>
			      					<td><%=user.getFullname() %></td>
			      				</tr>
			      				<tr>
			      					<th>Email</th>
			      					<td><%=user.getUsername() %></td>
			      				</tr>
			      			</tbody>	      			
			      		</table>
			      		<div>
			      			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>	
			      		</div>	
			      	</div>
			      </div>
			    </div>
			  </div>
			</div>	
	  <% 		
      	}
      	
      	else{
      %>
			<a class="btn btn-light my-2 my-sm-0 mr-2 butt" href="login.jsp"
				type="submit"><i class="fa fa-sign-in" aria-hidden="true"></i>
				Login</a> 
			
			<a class="btn btn-light my-2 my-sm-0 butt"
				href="register.jsp" type="submit"><i class="fa fa-user-plus"
				aria-hidden="true"></i> Register</a>
	  <%	
      	}
      %>
    </form>
  </div>
</nav>