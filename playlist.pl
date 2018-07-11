:- use_module(library(clpfd)).
dynamic hira.
dynamic genre.
dynamic vazo.

% -----------------hira(nom,artiste,duree en seconde,chemin)
% ----------- electro
hira(h1,'Faded','Alan Walker',212,'http://localhost/playlistProlog/electro/Alan Walker - Faded.mp3').
hira(h2,'Focus','Alan Walker',205,'http://localhost/playlistProlog/electro/Alan Walker - Focus.mp3').
hira(h3,'Force','Alan Walker',239,'http://localhost/playlistProlog/electro/Alan Walker - Force.mp3').
hira(h4,'Hope','Alan Walker',278,'http://localhost/playlistProlog/electro/Alan Walker - Hope.mp3').
hira(h5,'Spectre','Alan Walker',231,'http://localhost/playlistProlog/electro/Alan Walker - Spectre.mp3').
hira(h6,'all-falls-down','Alan Walker',220,'http://localhost/playlistProlog/electro/alan-walker-all-falls-down.mp3').

% ----------- pop
hira(h7,'Animal','Maroon5',229,'http://localhost/playlistProlog/pop/Animals.mp3').
hira(h8,'Move','Maroon5',201,'http://localhost/playlistProlog/pop/Move.mp3').
hira(h9,'america','Imagine dragons',273,'http://localhost/playlistProlog/pop/america.mp3').
hira(h10,'amsterdam','Imagine dragons',241,'http://localhost/playlistProlog/pop/amsterdam.mp3').
hira(h11,'selene','Imagine dragons',240,'http://localhost/playlistProlog/pop/selene.mp3').
hira(h12,'haunted','League',269,'F:http://localhost/playlistProlog/pop/03 Haunted.mp3').

% ----------- rap
hira(h13,'Fierté','TeamBS',246,'http://localhost/playlistProlog/rap/Team BS - Fierté.mp3').
hira(h14,'tous les memes','la fouine',259,'http://localhost/playlistProlog/rap/tous les memes.mp3').
hira(h15,'da vinci claude','Mc Solar',203,'http://localhost/playlistProlog/rap/da vinci claude.mp3').
hira(h16,'La vie est belle','Mc Solar',259,'http://localhost/playlistProlog/rap/McSolar - La vie est belle.mp3').
hira(h17,'Si je meurs ce soir','Mc Solar',243,'http://localhost/playlistProlog/rap/Mc Solaar - Si je meurs ce soir.mp3').
hira(h18,'Solaar Pleure','Mc Solar',269,'http://localhost/playlistProlog/rap/Solaar Pleure.mp3').

% ----------- rock
hira(h19,'Hypnotize','System Of A Down',189,'http://localhost/playlistProlog/rock/System Of A Down - Hypnotize.mp3').
hira(h20,'lonely-day','System Of A Down',167,'http://localhost/playlistProlog/rock/lonely-day.mp3').
hira(h21,'Toxicity','System of a Down',223,'http://localhost/playlistProlog/rock/System of a Down - Toxicity.mp3').
hira(h22,'yesterday','The Beatles',165,'http://localhost/playlistProlog/rock/yesterday.mp3').
hira(h23,'fuking perfect','Pink',214,'http://localhost/playlistProlog/rock/fuking perfect.mp3').
hira(h24,'Gun 21','Green Day',321,'http://localhost/playlistProlog/rock/Gun 21.mp3').


% ---------------- genre
genre(g1,electro).
genre(g2,pop).
genre(g3,rap).
genre(g4,rock).

% ---------------- vazo Mc Solaar - La vie est belle
vazo(h1,g1).
vazo(h2,g1).
vazo(h3,g1).
vazo(h4,g1).
vazo(h5,g1).
vazo(h6,g1).

vazo(h7,g2).
vazo(h8,g2).
vazo(h9,g2).
vazo(h10,g2).
vazo(h11,g2).
vazo(h12,g2).

vazo(h13,g3).
vazo(h14,g3).
vazo(h15,g3).
vazo(h16,g3).
vazo(h17,g3).
vazo(h18,g3).

vazo(h19,g4).
vazo(h20,g4).
vazo(h21,g4).
vazo(h22,g4).
vazo(h23,g4).
vazo(h24,g4).




% findall([IdH,Nom,Artiste,Duree,Chemin],hira(IdH,Nom,Artiste,Duree,Chemin),L).
% findall([IdG,Genre],genre(IdG,Genre),L).
% findall([H,G],vazo(H,G),L).


% findall([Id,Nom,Artiste,Duree,Chemin],(hira(Id,Nom,Artiste,Duree,Chemin),Nom='Faded'),L).
% findall([Id,Nom,Artiste,Duree,Chemin],(hira(Id,Nom,Artiste,Duree,Chemin),between(200,240,Duree)),L).


%------- calcul la Duree Total de la Playlist
sommeHira(Total):-
    findall(Duree,playlist(_,_,_,_,Duree,_,_),L),
    sumlist(L,Total).


playlist(IdH,IdG,Nom,Artiste,Duree,Chemin,Genre):-

    vazo(IdH,IdG),
    hira(IdH,Nom,Artiste,Duree,Chemin),
    genre(IdG,Genre).

%------------ list des genres
getGenre(IdG,Genre):-
    genre(IdG,Genre).

%------- cree une variable globale
%------- pour calculer le total de duree de la playlist
initCountTotal:-
    nb_setval(total,0).

%------- cree une variable globale
%------- pour recuperer l'indice d'un element
initIndice:-
    nb_setval(indice,0).


%------- contraintes :
%------- 1- entre min et max
%------- 2- filtre selon le genre
%------- 3- de duree total = Total
playlistByTotal(IdH,IdG,Nom,Artiste,Duree,Chemin,Genre,Min,Max,Totale,L):-

    vazo(IdH,IdG),
    hira(IdH,Nom,Artiste,Duree,Chemin),
    genre(IdG,Genre),
    %--- min < x < max
    Min =< Duree,
    Duree =< Max,

    %--- filtre by genre
     memberchk(Genre,L),

    %testNextGenre(Genre),

    %--- totalparcouru < total
    nb_getval(total,Val),
    Total is Val + Duree,
    nb_setval(total,Total),
    Total < Totale.


playlistFinal(IdH,IdG,Nom,Artiste,Duree,Chemin,Genre,Min,Max,Totale,L):-
    initCountTotal,
    playlistByTotal(IdH,IdG,Nom,Artiste,Duree,Chemin,Genre,Min,Max,Totale,L).



%------- recupere le genre d'un element de la playlist global
getGenreHiraByIndice(Indice,Ret):-
   findall(Genre,playlist(_,_,_,_,_,_,Genre),L),
   nth0(Indice,L,Ret),
   nb_setval(indice,0).



%findall([IdH,Nom,GEnre],playlistByTotal(IdH,IdG,Nom,Artiste,Duree,Chemin,Genre,1,1000,1000000),L).





