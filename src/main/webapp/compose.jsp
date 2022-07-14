<%@page import="com.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Compose</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- <style type="text/css">
body {
	background-color: #f0f0f0;
}
</style> -->


<style type="text/css">


.center {
  margin: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}
</style>


<script src="https://kit.fontawesome.com/238816e1e6.js"
	crossorigin="anonymous"></script>
</head>
<body>
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
							<i class="fa-solid fa-user-tie"></i>
							 &nbsp; <% UserDTO userDto = (UserDTO) session.getAttribute("email");%>
							<%=userDto.getEmail()%>
					</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="login.jsp">Logout</a></li>

						</ul></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Button trigger modal -->
		
		<div class="container">
  			<div class="center">
    			<button type="button" class="btn btn-danger" data-bs-toggle="modal"
					data-bs-target="#staticBackdrop">
					<i class="fa-solid fa-circle-plus"></i> New
					</button>
  			</div>
		</div>

	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">New Mail</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">						

						<div class="card border-secondary">
							<div class="card-body">
								<form action="new-email" method="post">
									<div class="mb-3">
										<label class="form-label">To</label> <input type="email"
											class="form-control" name="reciever" id="exampleInputEmail1">
									</div>

									<div class="mb-3">
										<label class="form-label">Subject</label> <input type="text"
											class="form-control" name="subject" id="exampleInputEmail1">
									</div>
									<div class="mb-3">
										<label class="form-label">Message</label> <input type="text"
											class="form-control" name="message" id="exampleInputEmail1">
									</div>


									<button type="reset" value="reset" class="btn btn-danger">
										Clear <i class="fa-solid fa-ban"></i>
									</button>
									<button type="submit" class="btn btn-success">
										Send <i class="fa-solid fa-paper-plane"></i>
									</button>
								</form>
							</div>
						</div>
				</div>
				
			</div>
		</div>
	</div>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
</html>