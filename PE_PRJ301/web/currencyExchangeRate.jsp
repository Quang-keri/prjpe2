<%-- 
    Document   : currencyExchangeRate
    Created on : Mar 14, 2025, 9:56:46 PM
    Author     : ADMIN
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="pe.model.Currency"%>
<%@page import="pe.model.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Currency Exchange</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

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

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #333;
            color: #fff;
        }
    </style>
</head>

<body>
    <header>
        <h1>Currency Exchange Rates</h1>
    </header>
    <%
        UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
        String name1=(String)request.getParameter("name1");
         String code1=(String)request.getParameter("code1");
      
         
    %>
    <nav>
        <a href="editCurrencyRate.jsp">Currency List</a>
        <a href="currencyExchangeRate.jsp">Hello  <%= user.getName()%></a>
        <a href="MainController?action=Logout">Logout</a>
    </nav>


    <form action="MainController" id="searchForm">
        <label for="code">Code:</label>
        <input type="text" id="code" name="code1" value="<%=code1!=null?code1:""%>"/>

        <label for="name">Name:</label>
        <input type="text" id="name" name="name1" value="<%=name1!=null ? name1:""%>" />

        <input type="submit" name="action" value="search" >
    </form>
    <%
        List<Currency> currList = (List<Currency>) request.getAttribute("LIST_CURRENCY");
        if (currList == null) {
            currList = new ArrayList<>();
        }
    %>
    <table>
        <thead>
            <tr>
                <th>Code</th>
                <th>Name</th>
                <th>Description</th>
                <th>Rate</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>USD</td>
                <td>US Dollar</td>
                <td>United States Dollar</td>
                <td>1.00</td>
            </tr>
            <tr>
                <td>EUR</td>
                <td>Euro</td>
                <td>European Union Currency</td>
                <td>0.85</td>
            </tr>
            <!-- Add more currency rows as needed -->
            <%
                for (Currency curr : currList) {
            %>

            <tr>

                <td><%= curr.getCode()%> </td>
                <td><%= curr.getName()%> </td>
                <td><%= curr.getDesc()%> </td>
                <td><%= curr.getRate()%> </td>
                <td>
                    <form action="editCurrencyRate.jsp" method="get" >
                        <input type="hidden" name="code" value="<%= curr.getCode()%>">
                        <input type="hidden" name="name" value="<%= curr.getName()%>">
                        <input type="hidden" name="desc" value="<%= curr.getDesc()%>">
                        <input type="hidden" name="rate" value="<%= curr.getRate()%>">
                        <input type="hidden" id="code" name="code1"  value="<%= request.getParameter("code1") %>">
                        <input type="hidden" id="name" name="name1" value="<%= request.getParameter("name1") %>" >
                        <button type="submit">Update</button>
                    </form>
                </td>
            </tr>

            <%
                }
            %>
        </tbody>
    </table>
</body>

</html>
