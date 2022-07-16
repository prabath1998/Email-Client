<%-- <%@page import="com.dto.UserDTO"%> --%>
<%@page import="com.dto.*"%>
<%@page import="com.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.card {
	margin: 0 auto; /* Added */
	float: none; /* Added */
	margin-bottom: 10px; /* Added */
	width: 200px;
	margin-top: 100px;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/238816e1e6.js"
	crossorigin="anonymous"></script>
</head>
<body>

	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");
	%>

	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
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
							<i class="fa-solid fa-user-tie"></i> &nbsp; <%
 UserDTO userDto = (UserDTO) session.getAttribute("email");
 %> <%=userDto.getEmail()%>
					</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="login.jsp"> Logout</a></li>

						</ul></li>
				</ul>
			</div>
		</div>
	</nav>


	<%
	String email = userDto.getEmail();
	int eid = (Integer) session.getAttribute("email_id");

	try {

		Connection conn = JDBCUtil.getConnection();
		String selectSQL = "SELECT * FROM emails where (reciever = '" + email + "' OR sender = '" + email + "') and email_id = '" + eid + "' ";
		Statement stm = conn.createStatement();
		ResultSet rs = stm.executeQuery(selectSQL);
		while (rs.next()) {
	%>



	<div class="col d-flex justify-content-center">
		<div class="card" style="width: 50rem;">
			<div class="card-body">
				<h5 class="card-title">
					<%=rs.getString("subject")%>
				</h5>
				<h6 class="card-subtitle mb-2 text-muted"><%=rs.getString("sender")%></h6>
				<p class="card-text">
					<%=rs.getString("message")%>
				</p>
				<p class="card-footer text-muted">
					<%=rs.getString("time")%>
				</p>
				<p><a href="home.jsp" class="text-danger">Back</a></p>
			</div>
		</div>
	</div>

	<%
	}
	} catch (Exception ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
	}
	%>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
</html>