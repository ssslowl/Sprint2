<%@ page import="models.User" %>

<ul class="nav justify-content-center">
    <li class="nav-item">
        <a class="nav-link active" href="/SprintTask2_Web_exploded/Home">Home</a>
    </li>

    <%
        User user = (User) request.getSession().getAttribute("user");
    %>

    <%if (user != null) {%>
    <li class="nav-item">
        <a class="nav-link" href="/SprintTask2_Web_exploded/profile">Profile</a>
    </li>

    <li class="nav-item">
        <a class="nav-link" href="#">Log out</a>
    </li>


    <%} else {%>

    <li class="nav-item">
        <a class="nav-link" href="/SprintTask2_Web_exploded/login">Sign in</a>
    </li>
    <%}%>
</ul>


