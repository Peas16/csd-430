<!-- Paul Fralix CSD430 Project -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.MovieBean, java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Movie Record</title>

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f4f6f9;
            margin: 40px;
        }

        h1, h2 {
            color: #2c3e50;
        }

        .container {
            background: white;
            padding: 25px;
            border-radius: 6px;
            box-shadow: 0px 0px 10px #ccc;
            width: 90%;
            margin: auto;
        }

        form {
            margin-bottom: 20px;
        }

        input {
            padding: 6px;
            margin: 6px 0;
            width: 250px;
        }

        input[type=submit] {
            width: auto;
            padding: 8px 16px;
            background-color: #2c3e50;
            color: white;
            border: none;
            cursor: pointer;
        }

        input[type=submit]:hover {
            background-color: #1b2838;
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
    </style>
</head>

<body>

<div class="container">

<p><a href="index.jsp">Return to Project Index</a></p>

<h1>CSD430 Movie Database – Add New Record</h1>

<p>
This form allows users to add a new movie record to the database.
After submission, all records will be displayed below.
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

        <h3 style="color:green;">New movie record successfully added.</h3>

<%
    }
%>

<!-- Input Form -->
<h2>Add Movie</h2>

<form method="post">
    Title: <br>
    <input type="text" name="title" required><br>

    Genre: <br>
    <input type="text" name="genre" required><br>

    Director: <br>
    <input type="text" name="director" required><br>

    Release Year: <br>
    <input type="number" name="release_year" required><br>

    Rating: <br>
    <input type="number" step="0.1" name="rating" required><br><br>

    <input type="submit" value="Add Movie">
</form>

<hr>

<h2>All Movie Records</h2>

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
    ResultSet rs = bean.getAllMovies();
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
            <td colspan="6">No records found in the database.</td>
        </tr>
<%
    }
%>

    </tbody>
</table>

</div>

</body>
</html>
