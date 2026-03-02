<!-- Paul Fralix CSD430 Project -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, beans.MovieBean" %>

<!DOCTYPE html>
<html>
<head>
    <title>Delete Movies</title>

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f4f6f9;
            margin: 40px;
        }

        h2 {
            color: #2c3e50;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            background-color: white;
            margin-top: 20px;
        }

        th {
            background-color: #2c3e50;
            color: white;
            padding: 10px;
        }

        td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        select, input[type=submit] {
            padding: 8px;
            margin-top: 10px;
        }

        .container {
            background: white;
            padding: 25px;
            border-radius: 6px;
            box-shadow: 0px 0px 10px #ccc;
            width: 90%;
            margin: auto;
        }

        .no-records {
            text-align: center;
            color: #555;
        }
    </style>
</head>

<body>

<div class="container">

<p><a href="index.jsp">Return to Project Index</a></p>

<h2>Updated Movie Database</h2>

<%
    MovieBean bean = new MovieBean();

    String movieParam = request.getParameter("movie_id");

    if (movieParam != null && !movieParam.trim().isEmpty()) {
        try {
            int movieId = Integer.parseInt(movieParam);
            bean.deleteMovie(movieId);
        } catch (NumberFormatException e) {
            out.println("<p style='color:red;'>Invalid Movie ID.</p>");
        }
    }

    ResultSet rs = bean.getAllMovies();
%>

<table>
<thead>
<tr>
    <th>Movie ID</th>
    <th>Title</th>
    <th>Genre</th>
    <th>Director</th>
    <th>Release Year</th>
    <th>Rating</th>
</tr>
</thead>
<tbody>

<%
boolean hasRecords = false;
while (rs.next()) {
    hasRecords = true;
%>
<tr>
    <td><%= rs.getInt("movie_id") %></td>
    <td><%= rs.getString("title") %></td>
    <td><%= rs.getString("genre") %></td>
    <td><%= rs.getString("director") %></td>
    <td><%= rs.getInt("release_year") %></td>
    <td><%= rs.getDouble("rating") %></td>
</tr>
<%
}
if (!hasRecords) {
%>
<tr>
    <td colspan="6" class="no-records">No records remain in the database.</td>
</tr>
<%
}
%>

</tbody>
</table>

<br>

<h3>Delete a Record</h3>

<form action="deleteMovies.jsp" method="post">

<select name="movie_id">
<%
ResultSet ids = bean.getAllMovieIDs();
boolean hasIds = false;

while (ids.next()) {
    hasIds = true;
%>
<option value="<%= ids.getInt("movie_id") %>">
<%= ids.getInt("movie_id") %>
</option>
<%
}

if (!hasIds) {
%>
<option value="">No records available</option>
<%
}
%>
</select>

<input type="submit" value="Delete Selected Movie">

</form>

</div>

</body>
</html>