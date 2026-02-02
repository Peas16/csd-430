<%-- Paul Fralix, 02/01/2026 CSD430 Assignment Mod 4 JavaBean --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="beans.MovieBean" %>

<%
    /* ---------------------------------------------------
       Java Scriptlet Section
       Purpose: Populate JavaBeans with Module 2 movie data
       --------------------------------------------------- */

    List<MovieBean> movies = new ArrayList<MovieBean>();

    MovieBean m1 = new MovieBean();
    m1.setTitle("The Shawshank Redemption");
    m1.setDirector("Frank Darabont");
    m1.setGenre("Drama");
    m1.setReleaseYear(1994);
    m1.setRating(9.3);
    movies.add(m1);

    MovieBean m2 = new MovieBean();
    m2.setTitle("Inception");
    m2.setDirector("Christopher Nolan");
    m2.setGenre("Science Fiction");
    m2.setReleaseYear(2010);
    m2.setRating(8.8);
    movies.add(m2);

    MovieBean m3 = new MovieBean();
    m3.setTitle("The Dark Knight");
    m3.setDirector("Christopher Nolan");
    m3.setGenre("Action");
    m3.setReleaseYear(2008);
    m3.setRating(9.0);
    movies.add(m3);

    MovieBean m4 = new MovieBean();
    m4.setTitle("Forrest Gump");
    m4.setDirector("Robert Zemeckis");
    m4.setGenre("Drama");
    m4.setReleaseYear(1994);
    m4.setRating(8.8);
    movies.add(m4);

    MovieBean m5 = new MovieBean();
    m5.setTitle("The Matrix");
    m5.setDirector("The Wachowskis");
    m5.setGenre("Science Fiction");
    m5.setReleaseYear(1999);
    m5.setRating(8.7);
    movies.add(m5);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Favorite Movies Collection</title>
    <style>
        table {
            border-collapse: collapse;
            width: 80%;
        }
        th, td {
            border: 1px solid #333;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>

<body>

<h1>Favorite Movies Collection</h1>

<p>
    This JSP page displays a collection of favorite movies using data stored
    in a JavaBean. The movie information was originally created in the
    Module 2 Java Scriptlet – Data Display assignment.
</p>

<h2>Field Descriptions</h2>
<ul>
    <li><strong>Title:</strong> Name of the movie</li>
    <li><strong>Director:</strong> Person who directed the movie</li>
    <li><strong>Genre:</strong> Movie category or theme</li>
    <li><strong>Release Year:</strong> Year the movie was released</li>
    <li><strong>Rating:</strong> Viewer rating score</li>
</ul>

<h2>Movie Data Table</h2>

<table>
    <thead>
        <tr>
            <th>Title</th>
            <th>Director</th>
            <th>Genre</th>
            <th>Release Year</th>
            <th>Rating</th>
        </tr>
    </thead>
    <tbody>

    <%
        // Loop through the JavaBean list and display values
        for (MovieBean m : movies) {
    %>
        <tr>
            <td><%= m.getTitle() %></td>
            <td><%= m.getDirector() %></td>
            <td><%= m.getGenre() %></td>
            <td><%= m.getReleaseYear() %></td>
            <td><%= m.getRating() %></td>
        </tr>
    <%
        }
    %>

    </tbody>
</table>

</body>
</html>
