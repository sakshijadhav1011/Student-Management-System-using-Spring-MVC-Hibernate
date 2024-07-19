<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Student</title>
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
    background-image:
        url('data:image/svg+xml;utf8,<svg viewBox="0 0 30 30" xmlns="http://www.w3.org/2000/svg"><path stroke="rgba%28255, 255, 255, 0.5%29" stroke-width="2" stroke-linecap="round" stroke-miterlimit="10" d="M4 7h22M4 15h22M4 23h22"/></svg>');
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
                    <li class="nav-item"><a class="nav-link" href="addStd">Add
                            Student</a></li>
                    <li class="nav-item"><a class="nav-link" href="search">Search
                            Student</a></li>
                </ul>
            </div>
        </div>
    </nav>
    
    <div class="container mt-5">
        <h2>Search Student</h2>
        <form id="searchForm" onsubmit="return submitForm()">
            <div class="mb-3">
                <label for="name" class="form-label">Enter Full Name</label>
                <input type="text" id="name" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
        <div id="result" class="mt-4">
            <c:if test="${not empty std}">
                <h3>Student Details</h3>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Department</th>
                            <th>Year</th>
                            <th>Email</th>
                            <th>Password</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${std.id}</td>
                            <td>${std.name}</td>
                            <td>${std.dept}</td>
                            <td>${std.year}</td>
                             <td>${std.email}</td>
                            <td>${std.pass}</td>
                        </tr>
                    </tbody>
                </table>
            </c:if>
        </div>
    </div>

    <script>
        function submitForm() {
            var nameInput = document.getElementById("name");
            var name = nameInput.value;

            if (name) {
                // Construct the URL with the entered name and navigate to it
                var url = "search/" + encodeURIComponent(name);
                window.location.href = url;
            }
            return false; // Prevent form submission
        }
    </script>

</body>
</html>
