<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	    			<li class="nav-item"><a href="/admin" class="nav-link" >Admin Dashboard</a></li>
	    			
	    			
	    		</c:if>
	    		<li class="nav-item"><a href="/profile" class="nav-link active" >Profile</a></li>
			</ul>
		</div>
    </nav>

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
    

 <%--    <form id="logoutForm" method="POST" action="/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        
    <c:if test="${isAdmin}">
    		<a href="/admin">Admin Dashboard</a>
    </c:if>
        
        <input type="submit" value="Logout!" />
    </form> --%>
<div class="container">

	  
	  	<h1>Your subscription</h1>

	<div class="jumbotron"><div class="container">
	  	
		    <div style="padding:10px; margin:10px; border: 1px solid black">
				<p>
				Current package: <c:out value="${chosedPack.name}"></c:out>
				</p>
				<p>
				Next Due date: <fmt:formatDate pattern="MMMM dd, yyyy" value="${currentUser.dueDate}" />
				</p>
		
				<p>
				Amaunt Due: &#x24; <c:out value="${chosedPack.cost}"></c:out>
				</p>
				<p>
				User since: <fmt:formatDate pattern="MMMM dd, yyyy" value="${currentUser.createdAt}" />
				</p>
			</div>
	</div></div>
    
</div>

</body>
</html>