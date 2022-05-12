<%@page import="com.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Compose</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style type="text/css">

</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="home.jsp">Cmail</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="home.jsp">Inbox</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="compose.jsp">Compose</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="outbox.jsp">Sent</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="drafts.jsp">Drafts</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="trash.jsp">Trash</a>
        </li>
        
       
      </ul>
      
       <ul class="navbar-nav ms-auto"">
            <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <%UserDTO userDto = (UserDTO)session.getAttribute("email");%> 
            <%=userDto.getEmail() %>
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="login.jsp">Logout</a></li>
            
          </ul>
        </li>
        </ul>
    </div>
  </div>
</nav>



<div class="container col-5 mt-10">
<h1>New Mail</h1>
<div class="card border-secondary">
	<div class="card-body">
		<form action="new-email" method="post">
  <div class="mb-3">
    <label  class="form-label">To</label>
    <input type="email" class="form-control" name="reciever" id="exampleInputEmail1" >    
  </div>
  
   <div class="mb-3">
    <label  class="form-label">Subject</label>
    <input type="text" class="form-control" name="subject" id="exampleInputEmail1" >    
  </div>
   <div class="mb-3">
    <label  class="form-label">Message</label>
    <input type="text" class="form-control" name="message" id="exampleInputEmail1" > 
  </div>
 
  
  <button type="reset" value="reset" class="btn btn-danger">Clear</button>
  <button type="submit" class="btn btn-success">Send</button>
</form>
	</div>
</div>

</div>


</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>