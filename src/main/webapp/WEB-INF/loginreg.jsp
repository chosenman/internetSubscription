<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>


</head>
<body>
<div class="container">
	<div class="row">
		<p>Admin access<br>
		<b>email:</b> a@b.com  <b>password:</b> 123456789
		</p>
	</div>
	<div class="row">
		<h1>Subscription for the Internet</h1>
		<hr>
	</div>
	<div class="row">
	    <c:if test="${errorMessage != null}">
		    	<span style="color:red">
		        <c:out value="${errorMessage}"></c:out>
		    </span>
	    </c:if>
	    <c:if test="${logoutMessage != null}">
	    		<span style="color:green">
	        <c:out value="${logoutMessage}"></c:out>
	        </span>
	    </c:if>
	</div>

	<div class="jumbotron">
      <div class="container row">
      

	<div class="col-6">
	





    <form method="POST" action="/login" class="form-signin">
        <h2 class="form-signin-heading">Login</h2>
        <p>
            <!-- <label for="username">Email</label> -->
            <input class="form-control" placeholder="Email address" type="email" id="username" name="username"/>
        </p>
        <p>
            <!-- <label for="password">Password</label> -->
            <input type="password" class="form-control" placeholder="password" id="password" name="password"/>
        </p>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" class="btn btn-lg btn-primary btn-block" value="Login!"  />
    </form>
</div>

<div class="col-6">
    <h1>Register!</h1>
    
	<p><form:errors path="user.*"/></p> 
    
    <form:form method="POST" action="/registration" modelAttribute="user">
    
 
    
        <p>
            <%-- <form:label path="username" >Email:</form:label> --%>
            <form:input path="username" class="form-control" placeholder="Email address" type="email"/>
        </p>
        
       <p>
            <%-- <form:label path="email" type="text">First Name:</form:label> --%>
            <form:input path="email" type="text" class="form-control" placeholder="First Name" />
        </p>
    
        <p>
            <%-- <form:label path="userlastname">last name:</form:label> --%>
            <form:input path="userlastname" class="form-control" placeholder="Last Name" />
        </p>
    

        <p>
            <%-- <form:label path="password">Password:</form:label> --%>
            <form:password path="password" class="form-control" placeholder="Password"/>
        </p>
        <p>
            <%-- <form:label path="passwordConfirmation">Password Confirmation:</form:label> --%>
            <form:password path="passwordConfirmation" class="form-control" placeholder="Confirmation Password" />
        </p>
        <input type="submit" value="Register!" class="btn btn-lg btn-primary btn-block" />
    </form:form>
</div>  
</div></div></div>
</body>
</html>