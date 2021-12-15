<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>

<link rel="stylesheet"href="css/home.css" type="text/css" />

</head>

<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<div class="homepage">
		<div class="login">
			<br> <br>
			<h1>Login</h1>
			
			<form action="${contextPath}/login.htm" method="POST">

				<div>
					Username: <input type="text" name="uname" placeholder="username"
						maxlength="20" required="required" size="20"><br /> <br />
					Password: <input type="password" name="pwd" placeholder="password"
						minlength="6" required="required" size="20"><br /> <br />
				</div>
				<div class="submit-login">
					<input type="submit" name="submit" value="Login"
						class="btn btn-primary">
				</div>
			</form>
		</div>

		<div class="register">
			<br> <br>
			<h1>Sign Up</h1>
		
		<div class = "container">
			<form class="form-group" action="${contextPath}/register.htm" method="POST">
				<div>
					 <label for="email">First Name:</label><input type="text" name="fname"
						placeholder="firstname" maxlength="20" required="required"
						size="20"><br> <br> 
						
					<label>Last Name:</label><input type="text" name="lname" 
						placeholder="lastname" maxlength="20" required="required" size="20"><br> <br> 
						
					<label>Email Address:</label><input type="email" name="email" placeholder="email"
						maxlength="50" required="required" size="20"><br> <br>
						
					<label>Username:</label><input type="text" name="uname"
						placeholder="username" maxlength="20" required="required" size="20"><br> <br> 
						
					<label>Password:</label><input
						type="password" name="pwd" placeholder="password" minlength="6"
						required="required" size="20"><br> <br> 

					<label>Select one from below:</label><br> 
						<input type="radio" name="role"
							value="student"> 	student &nbsp&nbsp
						 <input	type="radio" name="role" value="employer"> Employer <br> <br>
				</div>
				<div class="submit-registration">
					<input type="submit" name="submit" value="Register"
						class="btn btn-primary">
				</div>
			</form>
			</div>
		</div>
		<br /> <br />
		
	</div>
	
</body>
</html>