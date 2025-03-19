<%-- 
    Document   : login
    Created on : Mar 11, 2022, 9:02:11 PM
    Author     : hd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <!--your code here-->
        <form action="MainController" method="POST">
            UserID:<input type="text" name="userName"/>
            <br/>Password:<input type="password"  name="password"/>
            <br/><input type="submit" name="action" value="Login"/>
        </form>
    </body>
    <%
    String error =(String)request.getAttribute("ERROR");
    %>
    <%= error !=  null ?  error : ""%>
</html>

