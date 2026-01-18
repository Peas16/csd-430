<%-- Paul Fralix CSD430 01/17/2026 Assignment 1: My First JSP Application --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My First JSP Application</title>
</head>
<body>

<h1>Welcome to My JSP Application</h1>

<p>
    Current Date and Time:
    <strong>
        <%
            java.util.Date now = new java.util.Date();
            out.println(now.toString());
        %>
    </strong>
</p>

<p>
    <%
        String user = "Student";
        out.println("Hello, " + user + "! JSP is working correctly.");
    %>
</p>

</body>
</html>
