<%@page import="com.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="com.dto.*" %>
     <%@page import="com.util.*" %>
     <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trash</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/238816e1e6.js" crossorigin="anonymous"></script>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary" >
  <div class="container-fluid">
    <a class="navbar-brand" href="home.jsp">
    <i class="fa-solid fa-envelopes-bulk"></i>
    Cmail</a>
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
            <i class="fa-solid fa-user-tie"></i>
          	&nbsp;
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


 <span style="color: red;">${success}</span>
  
<h3 class="text-secondary">trash</h3>


<div>
<table class="table table-borderless table-hover">

<tr>
<th>Id</th>
<th>From</th>
<th>To</th>
<th>Subject</th>
<th>Message</th>
<th>Time</th>
<th></th>
<th></th>

</tr>

 <% 
 String emailId = userDto.getEmail();
 
		try{
			
			Connection conn = JDBCUtil.getConnection();
			String selectSQL = "SELECT * FROM emails where (sender = '" + emailId + "' OR reciever = '" + emailId + "' )  AND status='TRASH' ";
			Statement stm = conn.createStatement();
			ResultSet rs = stm.executeQuery(selectSQL);
			while(rs.next()){
				%>
					<tr>
					<td>
					<%=rs.getString("email_id") %>
					</td>
					<td><%=rs.getString("sender") %></td>
					<td><%=rs.getString("reciever") %></td>
					<td><%=rs.getString("subject") %></td>
					<td><%=rs.getString("message") %></td>
					<td><%=rs.getString("time") %></td>
					<%-- <td>
					<form method="post" action="return-mail">
					<button type="submit" name="restore" value="<%=rs.getString("email_id") %>" class="btn btn-warning" data-toggle="tooltip" data-placement="top" title="Restore">
					<i class="fa-solid fa-arrow-rotate-left"></i>
					</button>
					</form>
					</td> --%>
					<%-- <td>
					<button type="submit" name="delete" value="<%=rs.getString("email_id") %>" class="btn btn-danger" data-toggle="tooltip" data-placement="top" title="Delete permenently">
					<i class="fa-solid fa-eraser"></i>
					</button>
					</td> --%>	
					
					<td>

						<form action="delete-mail" method="post">
							<button type="submit" name="delete"
								value="<%=rs.getString("email_id")%>" class="btn btn-danger"
								data-toggle="tooltip" data-placement="top" title="delete permenently">
								<i class="fa-solid fa-eraser"></i>
							</button>
						</form>
					</td>
					<td>
						<form action="ViewMailContaroller" method="post">
							<button type="submit" name="view"
								value="<%=rs.getString("email_id")%>" class="btn btn-light"
								data-toggle="tooltip" data-placement="top" title="view">
								<i class="fa-solid fa-eye"></i>
							</button>
						</form>

					</td>				
					</tr>
				<%
			}
		}catch(Exception ex){
			out.println(ex.getMessage());
			ex.printStackTrace();
		}
		%>

</table>

</div>


</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>