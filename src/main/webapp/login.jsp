<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Cmail Login</title>
    <link rel="stylesheet" href="style.css">
  </head>
  <body>
    <div class="center">
      <h1>Login</h1>
      <form action="login" method="post">
      <span style="color: red;margin-left: 5px">${error}</span>
        <div class="txt_field">
        
          <input type="email" name="email">
          <span></span>
          <label>Username</label>
        </div>
        <div class="txt_field">
          <input type="password" name="password">
          <span></span>
          <label>Password</label>
        </div>
        <div class="pass">Forgot Password?</div>
        <input type="submit" value="Login">
        <div class="signup_link">
          Not a member? <a href="register.jsp">Signup</a>
        </div>
      </form>
    </div>

  </body>
</html>

