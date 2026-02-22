package beans;

import java.sql.*;
import java.util.ArrayList;

// Paul Fralix CSD430 Project

public class MovieBean {

    private Connection conn;

    // Constructor - establishes database connection
    public MovieBean() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/CSD430",
                "student1",
                "pass"
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Insert a new movie record
    public void addMovie(String title, String genre, String director,
                         int releaseYear, double rating) {

        try {
            String sql = "INSERT INTO paul_movies_data "
                       + "(title, genre, director, release_year, rating) "
                       + "VALUES (?, ?, ?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, genre);
            ps.setString(3, director);
            ps.setInt(4, releaseYear);
            ps.setDouble(5, rating);

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Get all movies (full records)
    public ResultSet getAllMovies() {
        try {
            Statement stmt = conn.createStatement();
            return stmt.executeQuery(
                "SELECT * FROM paul_movies_data"
            );
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Retrieve movie IDs (for dropdown)
    public ResultSet getAllMovieIDs() {
        try {
            Statement stmt = conn.createStatement();
            return stmt.executeQuery(
                "SELECT movie_id FROM paul_movies_data"
            );
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get all movie IDs as ArrayList (optional)
    public ArrayList<Integer> getMovieIds() {
        ArrayList<Integer> ids = new ArrayList<>();

        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(
                "SELECT movie_id FROM paul_movies_data"
            );

            while (rs.next()) {
                ids.add(rs.getInt("movie_id"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ids;
    }

    // Get a single movie record by ID
    public ResultSet getMovieById(int id) {

        try {
            PreparedStatement ps = conn.prepareStatement(
                "SELECT * FROM paul_movies_data WHERE movie_id = ?"
            );

            ps.setInt(1, id);
            return ps.executeQuery();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    // Update an existing movie record
    public void updateMovie(int id, String title, String genre,
                            String director, int releaseYear,
                            double rating) {

        try {
            String sql = "UPDATE paul_movies_data "
                       + "SET title=?, genre=?, director=?, "
                       + "release_year=?, rating=? "
                       + "WHERE movie_id=?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, title);
            ps.setString(2, genre);
            ps.setString(3, director);
            ps.setInt(4, releaseYear);
            ps.setDouble(5, rating);
            ps.setInt(6, movie_id);

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}