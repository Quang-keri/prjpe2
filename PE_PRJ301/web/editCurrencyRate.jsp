<%-- 
    Document   : editCurrencyRate
    Created on : Mar 17, 2025, 10:22:39 AM
    Author     : ADMIN
--%>

<%@page import="pe.model.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Currency Rate</title>
    <style>

        header {
            background-color: #333;
            padding: 10px;
            color: #fff;
            text-align: center;
        }

        nav {
            margin-bottom: 20px;
        }

        nav a {
            text-decoration: none;
            color: #333;
            padding: 10px;
            margin-right: 10px;
            border-radius: 5px;
            background-color: #eee;
        }
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
            box-sizing: border-box;
        }

        button {
            background-color: #333;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>




<header>
    <h1>Currency Exchange Rates</h1>
</header>
<%
    UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
    String code = request.getParameter("code");
    String name = request.getParameter("name");
    String desc = request.getParameter("desc");
    String rate = request.getParameter("rate");
    String error_Rate = (String) request.getAttribute("ERROR_RATE");
%>

<nav>
    <a href="editCurrencyRate.jsp">Currency List</a>
    <a href="currencyExchangeRate.jsp">Hello  <%= user.getName()%></a>
    <a href="MainController?action=Logout">Logout</a>
</nav>

<h2>Update Currency Rate</h2>

<form action="MainController" method="get">
    <label for="code">Code:</label>
    <input type="text" id="code" name="code" value="<%= code%>"  readonly="">

    <label for="name">Name:</label>
    <input type="text" id="name" name="name" value="<%= name%>" required="">

    <label for="description">Description:</label>
    <input type="text" id="description" name="desc" value="<%= desc%>" required="">

    <label for="rate">Rate:</label>
    <input type="number" id="rate" name="rate" value="<%= rate%>" step="0.01" /><%=error_Rate != null ? error_Rate : "alo"%>
    <input type="hidden" id="code" name="code1"  value="<%= request.getParameter("code1")%>">
    <input type="hidden" id="name" name="name1" value="<%= request.getParameter("code1")%>" >
    <input type="submit" name="action" value="Update Rate">
</form>
<h2>kiểm tra search</h2>
<p>name1: <%= request.getParameter("code2") != null ? request.getParameter("code2"):"null code nha" %></p>
<p>code1: <%= request.getParameter("name2") != null ? request.getParameter("name2"):"null name nha" %></p>
<script>
    function updateCurrency() {
        // Add your logic here to handle the form submission
        // You can use JavaScript to send the form data to a server for processing
        // For this example, we're keeping it simple with just the form structure
        alert("Currency rate updated successfully!");
    }
</script>



