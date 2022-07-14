<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Cmail Register</title>
    <link rel="stylesheet" href="style.css">
  </head>
  <body>
    <div class="center">
      <h1>Signup</h1>
      <form action="register" method="post">
      <span style="color: red;margin-left: 15px">${error}</span>
      
        <div class="txt_field">        
          <input type="text" name="fullName" id="fullname" required>
          <span></span>
          <label>Full Name</label>
        </div>        
        
        
        <div class="txt_field">        
          <input type="text" name="contact" id="contact" required>
          <span></span>
          <label>Contact Number</label>
        </div>
        
         <div class="txt_field">        
          <input type="text" name="email" id="email" required>
          <span></span>
          <label>Email</label>
        </div>
        
         <div class="txt_field">        
          <input type="password" name="password" id="password" required>
          <span></span>
          <label>Password</label>
        </div>
        
         <div class="">
         <input type="radio" id="male" name="gender" value="male" checked="checked">
	  	<label for=male>Male</label>
	  	<input type="radio" id="female" name="gender" value="female">
	  	<label for="female">Female</label><br><br>
                   
        </div>
                
        <input type="submit" value="Register">
        <div class="signup_link">
          Do you have a account? <a href="login.jsp">Signin</a>
        </div>
      </form>
    </div>

  </body>
</html>











