<!-- Paul Fralix CSD430 Project -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, beans.MovieBean" %>

<html>
<head>
<title>Delete Movie Records</title>
</head>
<body>

<%
int movieId = Integer.parseInt(request.getParameter("movie_id"));
MovieBean bean = new MovieBean();
bean.deleteMovie(movieId);

ResultSet rs = bean.getAllMovies();
%>

<h2>Updated Movie Database</h2>

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
<td colspan="6">No records remain in the database.</td>
</tr>
<%
}
%>

</tbody>
</table>

<br>

<form action="deleteProcess.jsp" method="post">

<select name="movie_id">
<%
ResultSet ids = bean.getAllMovieIDs();
while (ids.next()) {
%>
<option value="<%= ids.getInt("movie_id") %>">
<%= ids.getInt("movie_id") %>
</option>
<%
}
%>
</select>

<input type="submit" value="Delete Another Movie">

</form>

</body>
</html>