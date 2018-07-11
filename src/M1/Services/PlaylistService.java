package M1.Services;

import M1.Models.Hira;
import M1.Models.Playlist;
import org.jpl7.Query;
import org.jpl7.Term;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Andrianina_pc on 27/06/2018.
 */

public class PlaylistService {

    public static Playlist buildPlaylist(String requete){
        //------------ prolog query
        Query query = new Query("consult(\"E:/prolog/playlist.pl\")");
        List<Hira> results = new ArrayList<Hira>();
        if(query.hasMoreSolutions()){
            Query listData = new Query(requete);
            Map<String,Term>[] allData = listData.allSolutions();
            for (Map<String, Term> data : allData) {
                results.add(
                    new Hira(
                        data.get("IdH").toString(),
                        data.get("Nom").toString(),
                        data.get("Artiste").toString(),
                        data.get("Duree").intValue(),
                        data.get("Chemin").toString(),
                        data.get("Genre").toString()
                    )
                );
            }
        }
        //---------- build playlist
        Playlist playlist = new Playlist(results);
        return  playlist;
    }

    public static int getDureeTotal(){
        int ret = 0;
        //------------ prolog query
        Query query = new Query("consult(\"E:/prolog/playlist.pl\")");
        query.open();
        if(query.hasMoreSolutions()){
            Query data = new Query("sommeHira(Total).");
            data.open();
            Map<String,Term> total = data.getSolution();
            ret = total.get("Total").intValue();
        }
        return ret;
    }

}
