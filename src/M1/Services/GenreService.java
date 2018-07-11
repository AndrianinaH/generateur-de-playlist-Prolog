package M1.Services;

import M1.Models.Genre;
import M1.Models.Hira;
import org.jpl7.Query;
import org.jpl7.Term;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Andrianina_pc on 02/07/2018.
 */
public class GenreService {

    public static List<Genre> getAllGenre(String requete){
        //------------ prolog query
        Query query = new Query("consult(\"E:/prolog/playlist.pl\")");
        List<Genre> results = new ArrayList<Genre>();
        if(query.hasMoreSolutions()){
            Query listData = new Query(requete);
            Map<String,Term>[] allData = listData.allSolutions();
            for (Map<String, Term> data : allData) {
                results.add(
                    new Genre(
                        data.get("IdG").toString(),
                        data.get("Genre").toString()
                    )
                );
            }
        }
        return  results;
    }
}
