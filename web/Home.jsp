<%@ page import="java.util.List" %>
<%@ page import="models.Item" %><%--
  Created by IntelliJ IDEA.
  User: erasi
  Date: 13.02.2024
  Time: 20:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>


    <style>


        body{
            display: flex;
            flex-direction: column;
        }
        .card {

            border-radius: 25px;
        }

        img {
            height: 200px;


            object-fit: cover;
            border-radius: 25px;

        }

        .card-price {
            font-size: 24px;
            color: green;
            font-weight: bold;
        }

        section {
            padding-top: 30px;

        }

        .buy {
            width: 100%;
            height: 40px;
            border-radius: 0 0 25px 25px;

            background: #52a447;
        }

        .buy:hover {
            background: #3e893e;
        }

        .card-body {
            padding: 10px 0 0 0;
        }


    </style>
</head>
<body>
<%@include file="Header.jsp"%>

<%
    if(user == null){
        response.sendRedirect("login");
    }
%>




<section style="background-color: #eee;">

    <div class="text-center container">


        <h4 class="mt-4 mb-5"><strong>Bestsellers</strong></h4>



        <%
            List<Item> items = (List<Item>) request.getAttribute("items");

            int counter = 1;
            for (Item i : items) {
                if (counter == 1) {
        %>
        <div class="row">
            <%}%>
            <div class="col-lg-4 col-md-12 mb-4">
                <div class="card" style="width: 18rem;">
                    <img src="<%=i.getImg()%>" class="img" alt="...">
                    <div class="card-body">
                        <h5 class="card-title"><%=i.getName()%></h5>
                        <p class="card-text"><%= i.getDescription()%></p>
                        <p class="card-price"><%= i.getPrice()%>$</p>
                        <a href="#" class="btn buy">Details</a>
                    </div>
                </div>
            </div>
            <%
                counter++;
                if (counter == 4) {
                    counter = 1;
            %>
        </div>


        <%
                }
            }%>
    </div>
</section>


</body>
</html>
