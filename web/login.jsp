<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
    <style>
        /* Custom styles */
        body {
            background-color: #f8f9fa;
        }
        .login-form {
            margin-top: 100px;
        }
    </style>
</head>
<body>
<%@include file="Header.jsp"%>

<%
    if(user != null){
        response.sendRedirect("Home");
    }
%>


<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card login-form">
                <div class="card-header">
                    Login
                </div>
                <div class="card-body">
                    <%
                        String result = (String)request.getAttribute("result");
                        if( result != null) {
                    %>
                    <div class="alert alert-danger" role="alert">
                        <%=result%>
                    </div>
                    <%}%>


                    <form  method="post">
                        <div class="mb-3">
                            <label for="email" class="form-label">Email address</label>
                            <input type="text" name = "username" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" name = "password"  class="form-control" id="password" placeholder="Password">
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Login</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>

