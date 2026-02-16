<!-- Paul Fralix CSD430 Project -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.MovieBean, java.sql.ResultSet" %>

<html>
<head>
    <title>Add Movie Record</title>
</head>
<body>


<p><a href="index.jsp">Return to Project Index</a>

<h1>CSD430 Movie Database – Add New Record</h1>

<p>
This form allows users to add a new movie record to the
CSD430 database. After submission, all records will be displayed.
</p>

<%
    MovieBean bean = new MovieBean();

    if (request.getParameter("title") != null) {

        String title = request.getParameter("title");
        String genre = request.getParameter("genre");
        String director = request.getParameter("director");
        int year = Integer.parseInt(request.getParameter("release_year"));
        double rating = Double.parseDouble(request.getParameter("rating"));

        bean.addMovie(title, genre, director, year, rating);
%>

        <h3>New movie record successfully added.</h3>

<%
    }
%>

<!-- Input Form -->
<h2>Add Movie</h2>

<form method="post">
    Title: <input type="text" name="title" required><br><br>
    Genre: <input type="text" name="genre" required><br><br>
    Director: <input type="text" name="director" required><br><br>
    Release Year: <input type="number" name="release_year" required><br><br>
    Rating: <input type="number" step="0.1" name="rating" required><br><br>

    <input type="submit" value="Add Movie">
</form>

<hr>

<h2>All Movie Records</h2>

<table border="1">
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
    ResultSet rs = bean.getAllMovies();
    while (rs.next()) {
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
%>

    </tbody>
</table>

</body>
</html>
