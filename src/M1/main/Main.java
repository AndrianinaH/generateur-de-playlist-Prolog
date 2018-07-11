package M1.main;

import M1.Models.Genre;
import M1.Models.Playlist;
import M1.Services.GenreService;
import M1.Services.PlaylistService;
import org.jpl7.Query;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Andrianina_pc on 18/12/2017.
 */
public class Main {
    public static void main(String[] args) throws Exception{

        //---------- Test Prolog
//        Query query= new Query("consult(\"E:/prolog/reine.pl\")");
//        if(query.hasMoreSolutions()){
//            Query queryMainaBe = new Query("pbmDe4rein2(L1,L2,L3,L4).");
//            ArrayList<Result> results = new ArrayList<Result>();
//            while (queryMainaBe.hasMoreElements()){
//                System.out.println(queryMainaBe.next());
//                results.add(new Result(queryMainaBe.next().get("L1").intValue(),queryMainaBe.next().get("L2").intValue(),queryMainaBe.next().get("L3").intValue(),queryMainaBe.next().get("L4").intValue()));
//            }
//           Result.afficher(results);
//        }
//        String req = "playlist(IdH,IdG,Nom,Artiste,Duree,Chemin,Genre).";
        String req = "playlistFinal(IdH,IdG,Nom,Artiste,Duree,Chemin,Genre,200,259,3000,[electro,rap,pop]).";
        Playlist playlist = PlaylistService.buildPlaylist(req);

        System.out.println(PlaylistService.getDureeTotal());

        List<Genre> allGenre = GenreService.getAllGenre("getGenre(IdG,Genre).");
        System.out.println(allGenre.size());
    }
}
