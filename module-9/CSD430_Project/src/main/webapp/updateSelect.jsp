<!-- Paul Fralix CSD430 Project -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, beans.MovieBean" %>    
<!DOCTYPE html>
<html>
<head>
    <title>Select Movie to Update</title>

    <style>
        body {
            font-family: Arial;
            background-color: #f4f4f4;
        }

        h2 {
            color: #333;
        }

        table {
            background-color: white;
            border-collapse: collapse;
        }

        th {
            background-color: #444;
            color: white;
        }

        td, th {
            padding: 8px;
        }

        input, select {
            padding: 5px;
        }
    </style>
</head>
<body>

<p><a href="index.jsp">Return to Project Index</a>

<h2>Select Movie to Update</h2>

<%
MovieBean bean = new MovieBean();
ResultSet rs = bean.getAllMovieIDs();
%>

<form action="updateForm.jsp" method="post">
<select name="id">
<%
while(rs.next()){
%>
    <option value="<%= rs.getInt("movie_id") %>">
        <%= rs.getInt("movie_id") %>
    </option>
<%
}
%>
</select>
<br><br>
<input type="submit" value="Select Record">
</form>

</body>
</html>