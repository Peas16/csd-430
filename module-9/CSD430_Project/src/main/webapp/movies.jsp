<!-- Paul Fralix CSD430 Project -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="beans.MovieBean, java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
<head>
    <title>Movie Database Viewer</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 40px;
        }
        h1 {
            color: #2c3e50;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            background-color: white;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #2c3e50;
            color: white;
        }
        select, input[type=submit] {
            padding: 8px;
            margin-top: 10px;
        }
    </style>
</head>

<body>

<p><a href="index.jsp">Return to Project Index</a></p>

<h1>CSD430 – Movie Database</h1>
<p>This application retrieves movie records from the database using a JavaBean.</p>

<%
    MovieBean bean = new MovieBean();
%>

<!-- Dropdown Form -->
<form method="post">
    <label>Select Movie ID:</label>
    <select name="movie_id">
    <%
        ResultSet rsIds = bean.getAllMovieIDs();
        while (rsIds.next()) {
    %>
        <option value="<%= rsIds.getInt("movie_id") %>">
            <%= rsIds.getInt("movie_id") %>
        </option>
    <%
        }
    %>
    </select>

    <input type="submit" value="View Movie">
</form>

<%
    if (request.getParameter("movie_id") != null) {

        int movieId = Integer.parseInt(request.getParameter("movie_id"));
        ResultSet rs = bean.getMovieById(movieId);

        if (rs.next()) {
%>

<h2>Selected Movie Details</h2>

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
        <tr>
            <td><%= rs.getInt("movie_id") %></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("genre") %></td>
            <td><%= rs.getString("director") %></td>
            <td><%= rs.getInt("release_year") %></td>
            <td><%= rs.getDouble("rating") %></td>
        </tr>
    </tbody>
</table>

<%
        }
    }
%>

</body>
</html>