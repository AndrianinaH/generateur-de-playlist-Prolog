package M1.Models;

/**
 * Created by Andrianina_pc on 02/07/2018.
 */
public class Genre {
    private String idG;
    private String Genre;

    public Genre(){}

    public Genre(String idG, String genre) {
        this.idG = idG;
        Genre = genre;
    }

    public String getGenre() {
        return Genre;
    }

    public void setGenre(String genre) {
        Genre = genre;
    }

    public String getIdG() {
        return idG;
    }

    public void setIdG(String idG) {
        this.idG = idG;
    }
}
