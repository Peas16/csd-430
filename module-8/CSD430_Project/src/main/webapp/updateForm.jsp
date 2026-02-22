<!-- Paul Fralix CSD430 Project -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, beans.MovieBean" %>    
<!DOCTYPE html>
<html>
<head>
    <title>Update Movie</title>

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

<h2>Update Movie Record</h2>

<%
int id = Integer.parseInt(request.getParameter("id"));
MovieBean bean = new MovieBean();
ResultSet rs = bean.getMovieById(id);
rs.next();
%>

<form action="updateProcess.jsp" method="post">

ID (Cannot Update): 
<b><%= rs.getInt("movie_id") %></b>
<input type="hidden" name="movie_id" value="<%= rs.getInt("movie_id") %>">
<br><br>

Title:
<input type="text" name="title" value="<%= rs.getString("title") %>">
<br><br>

Director:
<input type="text" name="director" value="<%= rs.getString("director") %>">
<br><br>

Genre:
<input type="text" name="genre" value="<%= rs.getString("genre") %>">
<br><br>

Year:
<input type="text" name="release_year" value="<%= rs.getInt("release_year") %>">
<br><br>

Rating:
<input type="text" name="rating" value="<%= rs.getDouble("rating") %>">
<br><br>

<input type="submit" value="Update Record">

</form>

</body>
</html>