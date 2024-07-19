<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<%@ page import="com.sakshi.entity.Student"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<style>
		/* Custom CSS for the navbar */
		.navbar {
			background: linear-gradient(45deg, #f39c12, #e74c3c);
		}
		.navbar-brand, .nav-link {
			color: #fff !important;
		}
		.navbar-brand:hover, .nav-link:hover {
			color: #ffd700 !important;
		}
		.navbar-toggler {
			border-color: rgba(255, 255, 255, 0.5);
		}
		.navbar-toggler-icon {
			background-image: url('data:image/svg+xml;utf8,<svg viewBox="0 0 30 30" xmlns="http://www.w3.org/2000/svg"><path stroke="rgba%28255, 255, 255, 0.5%29" stroke-width="2" stroke-linecap="round" stroke-miterlimit="10" d="M4 7h22M4 15h22M4 23h22"/></svg>');
		}
		.nav-item .active {
			background: rgba(255, 255, 255, 0.1);
			border-radius: 5px;
		}
		.navbar-nav .nav-link {
			padding: 10px 20px;
			margin: 5px 0;
		}
	</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
	integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
	integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
	crossorigin="anonymous"></script>
	
	
</head>
<body>

	<nav class="navbar navbar-expand-lg bg-body-tertiary bg-warning">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Student Management System</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="home">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="addStd">Add Student</a></li>
					<li class="nav-item"><a class="nav-link" href="search">Search Student</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<%
	List<Student> stdList = (List<Student>) request.getAttribute("stdList");
	%>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header text-center">
						<h3>All Students Available</h3>
					</div>
					<div class="card-body">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Name</th>
									<th scope="col">Department</th>
									<th scope="col">Year</th>
									<th scope="col">Email</th>
									<th scope="col">Password</th>
									<th scope="col">Actions</th>
								</tr>
							</thead>
							<tbody>
								<%
								for (Student std : stdList) {
								%>
								<tr>
									<td><%=std.getId()%></td>
									<td><%=std.getName()%></td>
									<td><%=std.getDept()%></td>
									<td><%=std.getYear()%></td>
									<td><%=std.getEmail()%></td>
									<td><%=std.getPass()%></td>
									<td>
										<a href="editStd/<%=std.getId()%>" class="btn btn-sm btn-primary">Edit</a>
										<a href="deleteStd/<%=std.getId()%>" class="btn btn-sm btn-danger">Delete</a>
									</td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>