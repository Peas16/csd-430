/** Paul Fralix 02/01/2026 CSD430 Assignment Mod 4 JavaBean */


package beans;

import java.io.Serializable;

/**
 * MovieBean
 * ----------
 * JavaBean used to store movie information.
 * Converted from Module 2 JSP scriptlet data.
 */
public class MovieBean implements Serializable {

    private static final long serialVersionUID = 1L;

    // Fields (minimum 5 for this assignment)
    private String title;
    private String director;
    private String genre;
    private int releaseYear;
    private double rating;

    // No-argument constructor
    public MovieBean() {
    }

    // Getters and setters
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDirector() {
        return director;
    }
 
    public void setDirector(String director) {
        this.director = director;
    }

    public String getGenre() {
        return genre;
    }
 
    public void setGenre(String genre) {
        this.genre = genre;
    }

    public int getReleaseYear() {
        return releaseYear;
    }
 
    public void setReleaseYear(int releaseYear) {
        this.releaseYear = releaseYear;
    }

    public double getRating() {
        return rating;
    }
 
    public void setRating(double rating) {
        this.rating = rating;
    }
}
