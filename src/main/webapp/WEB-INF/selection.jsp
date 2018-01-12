<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
				<li class="nav-item active"><a href="/selection" class="nav-link">Select Subscription</a></li>
		    <c:if test="${isAdmin}">
	    			<li class="nav-item"><a href="/admin" class="nav-link" >Admin Dashboard</a></li>
	    			<li class="nav-item"><a href="/profile" class="nav-link" >Profile</a></li>
	    		</c:if>
			</ul>
		</div>
    </nav>

<%--     <form id="logoutForm" method="POST" action="/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="Logout!" />
    </form> --%>


<div class="container">

	  
	  	<h1>Subscription plan</h1>
	  
	  
	  
	<div class="jumbotron">

	  
      <div class="container">


    <c:if test="${logoutMessage != null}">
    		<span style="color:green">
        <c:out value="${logoutMessage}"></c:out>
        </span>
    </c:if>

    <c:if test="${errorMessage != null}">
	    	<span style="color:red">
	        <c:out value="${errorMessage}"></c:out>
	    </span>
    </c:if>
    


    
    <div class="row">
   		 <h3>Please choose a subscription and due date:</h3>
    </div>
   
    <div class="row">
	     <form method="POST" action="/selection/subscribe" class=" form-signin" >
	     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	     	<p>Due Date:
	     	<select name="dueDate" class="form-control">
	     		<c:forEach var="d" items=" ${days}" varStatus="loop">
	     			<option value="${loop.index+1}">${loop.index+1}</option>
	     		</c:forEach>
	     	</select></p>
	     	<p>Package
	     	<select name="package_id" class="form-control">
	     		<c:forEach var="p" items="${packages}">
	     			<c:if test="${p.available}">
	     				<option value="${p.id}">${p.name}</option>
	     			</c:if>
	     		</c:forEach>
	     	</select></p>
	     	<input type="submit" value="Sign Up!" class="btn btn-lg btn-primary btn-block">
	     </form>
     </div>
    
    </div></div>
</div>
</body>
</html>