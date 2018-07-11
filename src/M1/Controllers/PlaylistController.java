package M1.Controllers;

import M1.Models.Genre;
import M1.Models.Playlist;
import M1.Services.GenreService;
import M1.Services.PlaylistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by Andrianina_pc on 01/07/2018.
 */
@Controller
public class PlaylistController {

    @RequestMapping("/")
    public ModelAndView index() throws Exception {
        List<Genre> allGenre = GenreService.getAllGenre("getGenre(IdG,Genre).");
        int total = PlaylistService.getDureeTotal();
        ModelAndView model = new ModelAndView("index");
        model.addObject("color", "red");
        model.addObject("title", "Générateur de playlist");
        model.addObject("titre", "Programmation logique par contrainte");
        model.addObject("total",total);
        model.addObject("allGenre",allGenre);
        return model;
    }
    //----------- recuperation du init
    @RequestMapping(value="/generate-playlist", method = RequestMethod.POST)
    public ModelAndView generatePlaylist(@RequestParam("total") int total,
                                         @RequestParam("min") int min,
                                         @RequestParam("max") int max,
                                         @RequestParam("allGenre") String[] allGenre) throws Exception {

        String genres = "";
        for (int i = 0; i < allGenre.length; i++)  {
            genres += allGenre[i];
            if (i != allGenre.length-1) genres+=",";
        }
        String requete = "playlistFinal(IdH,IdG,Nom,Artiste,Duree,Chemin,Genre,"+min+","+max+","+total+",["+genres+"]).";
        Playlist playlist = PlaylistService.buildPlaylist(requete);
        ModelAndView model = new ModelAndView("generated-playlist");
        model.addObject("color", "red");
        model.addObject("title", "Playlist générer");
        model.addObject("titre", "Programmation logique par contrainte");
        model.addObject("playlist", playlist.getPlayList());
        return model;
    }
}
