package beans;

import java.sql.*;
import java.util.ArrayList;

// Paul Fralix CSD430 Project

public class MovieBean {

    // ======================================
    // DEFAULT CONSTRUCTOR 
    // ======================================
    public MovieBean() {
    }

    // ======================================
    // DATABASE CONNECTION METHOD
    // ======================================
    private Connection getConnection() {

        Connection conn = null;

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

        return conn;
    }

    // ======================================
    // ADD MOVIE
    // ======================================
    public void addMovie(String title, String genre, String director,
                         int releaseYear, double rating) {

        try {
            Connection conn = getConnection();

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
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // ======================================
    // GET ALL MOVIES
    // ======================================
    public ResultSet getAllMovies() {

        ResultSet rs = null;

        try {
            Connection conn = getConnection();

            String sql = "SELECT * FROM paul_movies_data";
            PreparedStatement ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rs;
    }

    // ======================================
    // GET ALL MOVIE IDS (FOR DROPDOWN)
    // ======================================
    public ResultSet getAllMovieIDs() {

        ResultSet rs = null;

        try {
            Connection conn = getConnection();

            String sql = "SELECT movie_id FROM paul_movies_data";
            PreparedStatement ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rs;
    }

    // ======================================
    // GET SINGLE MOVIE BY ID
    // ======================================
    public ResultSet getMovieById(int id) {

        ResultSet rs = null;

        try {
            Connection conn = getConnection();

            String sql = "SELECT * FROM paul_movies_data WHERE movie_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            rs = ps.executeQuery();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rs;
    }

    // ======================================
    // UPDATE MOVIE
    // ======================================
    public void updateMovie(int id, String title, String genre,
                            String director, int releaseYear,
                            double rating) {

        try {
            Connection conn = getConnection();

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
            ps.setInt(6, id);

            ps.executeUpdate();
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // ======================================
    // DELETE MOVIE
    // ======================================
    public void deleteMovie(int movie_id) {

        try {
            Connection conn = getConnection();

            String sql = "DELETE FROM paul_movies_data WHERE movie_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, movie_id);

            ps.executeUpdate();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}