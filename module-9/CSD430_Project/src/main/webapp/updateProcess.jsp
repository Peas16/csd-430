<!-- Paul Fralix CSD430 Project -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, beans.MovieBean" %>    
<!DOCTYPE html>
<html>
<head>
    <title>Updated Record</title>

    <style>
        body {
            font-family: Arial;
            background-color: #f4f4f4;
            margin: 40px;
        }

        h2 {
            color: #333;
        }

        table {
            background-color: white;
            border-collapse: collapse;
            width: 100%;
        }

        th {
            background-color: #444;
            color: white;
        }

        td, th {
            padding: 8px;
            text-align: center;
        }

        input, select {
            padding: 5px;
        }
    </style>
</head>
<body>

<p><a href="index.jsp">Return to Project Index</a></p>

<h2>Record Successfully Updated</h2>

<%
int id = Integer.parseInt(request.getParameter("movie_id"));
String title = request.getParameter("title");
String director = request.getParameter("director");
String genre = request.getParameter("genre");
int year = Integer.parseInt(request.getParameter("release_year"));
double rating = Double.parseDouble(request.getParameter("rating"));

MovieBean bean = new MovieBean();
bean.updateMovie(id, title, director, genre, year, rating);

ResultSet rs = bean.getMovieById(id);
rs.next();
%>

<table border="1" cellpadding="5">
    <thead>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Director</th>
            <th>Genre</th>
            <th>Year</th>
            <th>Rating</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><%= rs.getInt("movie_id") %></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("director") %></td>
            <td><%= rs.getString("genre") %></td>
            <td><%= rs.getInt("release_year") %></td>
            <td><%= rs.getDouble("rating") %></td>
        </tr>
    </tbody>
</table>

</body>
</html>