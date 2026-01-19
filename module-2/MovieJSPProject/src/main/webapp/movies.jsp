<%-- Paul Fralix CSD430 01/18/2026 Assignment Moudle 2 --%>

<<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>

<%
    /* ---------------------------------------------------
       Java Scriptlet Section
       Purpose: Define movie data and store records
       --------------------------------------------------- */

    class Movie {
        String title;
        String director;
        String genre;

        Movie(String title, String director, String genre) {
            this.title = title;
            this.director = director;
            this.genre = genre;
        }
    }

    // Create and populate the movie list
    List<Movie> movies = new ArrayList<Movie>();
    movies.add(new Movie("The Shawshank Redemption", "Frank Darabont", "Drama"));
    movies.add(new Movie("Inception", "Christopher Nolan", "Science Fiction"));
    movies.add(new Movie("The Dark Knight", "Christopher Nolan", "Action"));
    movies.add(new Movie("Forrest Gump", "Robert Zemeckis", "Drama"));
    movies.add(new Movie("The Matrix", "The Wachowskis", "Science Fiction"));
%>

<!DOCTYPE html>
<html>
<head>
    <title>Favorite Movies</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>

<body>

<h1>Favorite Movies Collection</h1>

<p class="description">
    This dynamic JSP page displays a list of movies I have enjoyed watching.
    Java Scriptlets are used to store and manage the movie data, while HTML
    and CSS are used to present the data in a structured and styled format.
</p>

<h2>Data Description</h2>
<ul>
    <li><strong>Title:</strong> Name of the movie</li>
    <li><strong>Director:</strong> Person who directed the movie</li>
    <li><strong>Genre:</strong> Movie category or theme</li>
</ul>

<table>
    <thead>
        <tr>
            <th>Movie Title</th>
            <th>Director</th>
            <th>Genre</th>
        </tr>
    </thead>
    <tbody>
        <%
            // Loop through movie records and display them
            for (Movie m : movies) {
        %>
        <tr>
            <td><%= m.title %></td>
            <td><%= m.director %></td>
            <td><%= m.genre %></td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>

</body>
</html>
