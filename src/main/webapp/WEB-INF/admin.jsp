<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome Page</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>


</head>
<body>

   <nav class="navbar navbar-toggleable-md navbar-inverse bg-inverse fixed-top_OFF">
	<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      
      
	 <div class="navbar-brand" >
	 	<table>
	 		<tr>
	 			<td style="padding-right:20px">  Hello ${currentUser.getEmail()}</td>
	 		
	 			<td>
			 	   <form id="logoutForm" method="POST" action="/logout" class="form-inline my-2 my-lg-0">
			
				        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				        <input type="submit" value="Logout!" class="btn btn-outline-success my-2 my-sm-0" />
				    </form>
	 			</td>
	 		</tr>
	 	</table>
	
	</div> 

	<div class="collapse navbar-collapse right" id="navbarsExampleDefault">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item "><a href="/selection" class="nav-link">Select Subscription</a></li>
		    <c:if test="${isAdmin}">
	    			<li class="nav-item active"><a href="/admin" class="nav-link" >Admin Dashboard</a></li>
	    		</c:if>
	    			<li class="nav-item"><a href="/profile" class="nav-link" >Profile</a></li>
			</ul>
	</div>
    </nav>
    		


    <div class="container">
    
   <h1>Admin dashboard</h1>

    <div class="jumbotron">
      <div class="container">
        
 


 
  
    
   <table style="width:100%">
   <tr style="background:#ccc"><td>Name</td><td>Next Due Date</td><td>Ammount Due</td><td>Package Type</td>
   </tr>
    <c:forEach var="u" items="${allUsers}" >
    		<c:if test="${!currentUser.id.equals(u.id) }">
	    		<tr>
	    			<td>${u.email}</td>
				<td><fmt:formatDate pattern="MMMM dd, yyyy" value="${u.dueDate}" /></td>
				<td>&#x24; ${u.getChoosed_package().getCost()}</td>
				<td>${u.getChoosed_package().getName()}</td>
     	</c:if>
    </c:forEach>
    </table>
    
    <hr>
    <h1>Packages</h1>
   <table style="width:100%">
   <tr style="background:#ccc"><td>Package Name</td><td>Package Cost</td><td>Available</td><td>Users</td><td>Actions</td></tr>
    <c:forEach var="p" items="${packages}" >
    		<tr ><td>${p.name}</td>
    		<td>&#x24; ${p.getCost()}</td>
    		<td><c:if test="${p.available}">available</c:if><c:if test="${!p.available}">unavailable</c:if></td>
    		<td>${p.users.size()}</td>
    		<td>
			<c:if test="${p.available}">
				<a href="/admin/pack/${p.id}/deactivate">deactivate</a>
				<a href="/admin/pack/${p.id}/delete">delete</a>
			</c:if><c:if test="${!p.available}">
				<a href="/admin/pack/${p.id}/activate">activate</a>
			</c:if>
		</td></tr>
    </c:forEach>
    </table>
    <hr>
    <!-- ADD new PACKAGE  -->
    	<h2>Create new package:</h2>
		 <form:form method="POST" action="/admin/newpack" modelAttribute="pack" class=" form-signin" >
		 	<form:hidden path="id"/>
		 	
		 	<form:hidden path="available" value="false"/>
		    
<%-- 		    <form:label path="name">Name: </form:label> --%>
		    <form:input path="name" class="form-control" placeholder="Package Name" />
		    <span style="color:red"><form:errors path="name"/></span>
		    <br/>

		    <%-- <form:label path="cost">Cost: </form:label> --%>
		    <form:input path="cost" type="number" class="form-control" placeholder="Package Price"  />
		    <span style="color:red"><form:errors path="cost"/></span>
		    <br/>
		    
		    <input type="submit" value="Submit" class="btn btn-primary my-2" />
		</form:form>
    <!--  -->
    
      </div>

    </div><!-- /.container -->
</body>
</html>