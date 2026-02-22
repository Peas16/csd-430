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
<tr>
    <th>ID (INT)</th>
    <th>Title (VARCHAR)</th>
    <th>Director (VARCHAR)</th>
    <th>Genre (VARCHAR)</th>
    <th>Year (INT)</th>
    <th>Rating (DOUBLE)</th>
</tr>

<tr>
    <td><%= rs.getInt("movie_id") %></td>
    <td><%= rs.getString("title") %></td>
    <td><%= rs.getString("director") %></td>
    <td><%= rs.getString("genre") %></td>
    <td><%= rs.getInt("release_year") %></td>
    <td><%= rs.getDouble("rating") %></td>
</tr>
</table>

</body>
</html>