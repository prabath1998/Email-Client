<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="style.css">
</head>
<body>

<%session.invalidate(); %>
<div class="login">
  <div class="login-triangle"></div>
  
  <h2 class="login-header">Sign in</h2>

  <form class="login-container" action="login" method="post">
  	<div class="container">
  	<span style="color: red;margin-left: 15px">${error}</span>
  	</div>
    <p><input type="email" name="email" placeholder="Email"></p>
    <p><input type="password" name="password" placeholder="Password"></p>
    <p><input type="submit" value="Log in"></p>
    <p class="message">Not registered? <a href="register.jsp">Create an account</a></p>
  </form>
</div>


</body>
</html>