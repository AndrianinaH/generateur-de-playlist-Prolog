package M1.Models;

import java.util.List;

/**
 * Created by Andrianina_pc on 27/06/2018.
 */
public class Playlist {

    private List<Hira> playList;

    public Playlist(){}

    public Playlist(List<Hira> playList) {
        this.playList = playList;
    }

    public List<Hira> getPlayList() {
        return playList;
    }

    public void setPlayList(List<Hira> playList) {
        this.playList = playList;
    }
}
