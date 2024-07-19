<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Student</title>
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

	<div class="conatiner">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header text-center">
						<h3>Edit Student</h3>
					</div>
					<div class="card-body">
						<form action="${pageContext.request.contextPath}/updateStd"
							method="post">
							<input type="hidden" name="id" value="${std.id}">
							<div class="mb-3">
								<label>Enter Full Name</label> <input type="text" name="name"
									class="form-control" value="${std.name }">
							</div>
							<div class="mb-3">
								<label>Enter Department</label> <input type="text" name="dept"
									class="form-control" value="${std.dept }">
							</div>

							<div class="mb-3">
								<label>Enter year</label> <input type="text" name="year"
									class="form-control" value="${std.year }">
							</div>
							<div class="mb-3">
								<label>Enter Email</label> <input type="text" name="email"
									class="form-control" value="${std.email }">
							</div>

							<div class="mb-3">
								<label>Enter Password</label> <input type="text" name="pass"
									class="form-control" value="${std.pass }">
							</div>


							<button class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>