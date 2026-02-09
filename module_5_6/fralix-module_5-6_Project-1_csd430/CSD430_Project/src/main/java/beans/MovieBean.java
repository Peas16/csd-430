package beans;

import java.sql.*;
import java.util.ArrayList;

public class MovieBean {

    private Connection conn;

    // Constructor
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

    // Get all movie IDs (Primary Keys)
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
}
