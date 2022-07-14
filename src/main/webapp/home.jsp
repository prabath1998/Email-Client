<%@page import="com.service.EmailService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.dto.*"%>
<%@page import="com.util.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inbox</title>
<!-- <link rel="stylesheet" href="css/bootstrap.css">  -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/238816e1e6.js"
	crossorigin="anonymous"></script>

<style type="text/css">
/* body{
  margin: 0;
  padding: 0;
  background: linear-gradient(120deg,#2980b9, #8e44ad);
  height: 100vh;
  overflow: hidden;
} */
</style>

</head>
<body>

	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");
	%>

	<nav class="navbar navbar-expand-lg navbar-dark bg-primary" >
		<div class="container-fluid">
			<a class="navbar-brand" href="home.jsp"> <i
				class="fa-solid fa-envelopes-bulk"></i> Cmail
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="home.jsp">Inbox</a></li>
					<li class="nav-item"><a class="nav-link" href="compose.jsp">Compose</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="outbox.jsp">Sent</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="drafts.jsp">Drafts</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="trash.jsp">Trash</a>
					</li>
				</ul>

				<ul class="navbar-nav ms-auto"">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="fa-solid fa-user-tie"></i> &nbsp;  
							<%UserDTO userDto = (UserDTO)session.getAttribute("email");%> 
							<%=userDto.getEmail()%>
					</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="login.jsp"> Logout</a></li>

						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<h3 class="text-secondary">Inbox</h3>
	<div>
		<table class="table table-borderless table-hover">
			<form action="trash-mail" method="post">
				<tr>
					<th>Id</th>
					<th>From</th>
					<th>Subject</th>
					<th>Message</th>
					<th>Time</th>
					<th></th>
				</tr>
				<%
				String emailId = userDto.getEmail();
				try {

					Connection conn = JDBCUtil.getConnection();
					String selectSQL = "SELECT * FROM emails where reciever = '" + emailId + "' and status = 'SENT'";
					Statement stm = conn.createStatement();
					ResultSet rs = stm.executeQuery(selectSQL);
					while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("email_id")%></td>
					<td><%=rs.getString("sender")%></td>
					<td><i><%=rs.getString("subject")%></i></td>
					<td><%=rs.getString("message")%></td>
					<td><%=rs.getString("time")%></td>
					<td><button type="submit" name="trash"
							value="<%=rs.getString("email_id")%>" class="btn btn-warning"
							data-toggle="tooltip" data-placement="top" title="Move to trash">
							<i class="fa-solid fa-trash"></i>
						</button></td>
				</tr>
				<%
				}
				} catch (Exception ex) {
				out.println(ex.getMessage());
				ex.printStackTrace();
				}
				%>
		</div>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

</html>