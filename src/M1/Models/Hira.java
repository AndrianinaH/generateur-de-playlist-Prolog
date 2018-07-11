package M1.Models;

/**
 * Created by Andrianina_pc on 27/06/2018.
 */
public class Hira {
    private String idH;
    private String nom;
    private String artiste;
    private int duree;
    private String chemin;
    private String genre;

    public Hira(String idH, String nom, String artiste, int duree, String chemin, String genre) {
        this.idH = idH;
        this.nom = nom;
        this.artiste = artiste;
        this.duree = duree;
        this.chemin = chemin;
        this.genre = genre;
    }

    public String getIdH() {
        return idH;
    }

    public void setIdH(String idH) {
        this.idH = idH;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getArtiste() {
        return artiste;
    }

    public void setArtiste(String artiste) {
        this.artiste = artiste;
    }

    public int getDuree() {
        return duree;
    }

    public void setDuree(int duree) {
        this.duree = duree;
    }

    public String getChemin() {
        return chemin;
    }

    public void setChemin(String chemin) {
        this.chemin = chemin;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }
}
