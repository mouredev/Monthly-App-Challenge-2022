package joseoliva.com.coreteindevs.providers

import joseoliva.com.coreteindevs.R
import joseoliva.com.coreteindevs.models.ProducTextil

class VideosProvider {
    companion object{
        val listaVideos = listOf<ProducTextil>(
            ProducTextil("ready player one",R.drawable.readyplayer,11.95f,"Ningún programador puede pasar sin ver ésta obra de la literatura llevada al cine por el gran Steven Spielberg","https://www.amazon.es/Ready-Player-One-Blu-ray-Sheridan/dp/B08V9TGH2P/ref=asc_df_B08V9TGH2P/?tag=googshopes-21&linkCode=df0&hvadid=469132743785&hvpos=&hvnetw=g&hvrand=18210732397736572269&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=1005493&hvtargid=pla-1188796705393&psc=1"),
            ProducTextil("matrix",R.drawable.matrix,11.95f,"Obra maestra que nadie se debería perder","https://www.amazon.es/Matrix-Blu-ray-Keanu-Reeves/dp/B0053C8UNE"),
            ProducTextil("tron",R.drawable.tron,11.95f,"Un clásico de los que puedes ver una y otra vez...","https://www.amazon.es/s?k=tron+blura&i=dvd&__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=25C0K3APLREYH&sprefix=tron+blura%2Cdvd%2C103&ref=nb_sb_noss_2"),
            ProducTextil("juegos de guerra",R.drawable.guerra,11.95f,"Un clásico de los 80 absolutamente imprescindible para todo programador que presuma de serlo","https://www.amazon.es/Juegos-Guerra-Blu-ray-Matthew-Broderick/dp/B00AK948UE/ref=sr_1_1?__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=Z38P4W1X0Y2E&keywords=juegos+de+guerra+blu+ray&qid=1670629999&s=dvd&sprefix=juegos+de+guerra+blu+ray%2Cdvd%2C79&sr=1-1"),
            ProducTextil("the imitation game",R.drawable.enigma,22.99f,"Imprescindible para los amantes del cifrado.","https://www.amazon.es/Imitation-Game-Descifrando-Enigma-Blu-ray/dp/B00SFXR4VM"),
            ProducTextil("el quinto poder",R.drawable.poder,10.50f,"Un clásico de los que puedes ver una y otra vez...","https://www.amazon.es/Quinto-Poder-Blu-ray-Benedict-Cumberbatch/dp/B00IP9BKR0/ref=sr_1_1?__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=2W8X9BM8BRLG2&keywords=el+quinto+poder+bluray&qid=1670709757&s=dvd&sprefix=el+quinto+poder+bluray%2Cdvd%2C90&sr=1-1"),
            ProducTextil("Her",R.drawable.her,12.43f,"Excelente película que nos dejará pensando sobre la inteligencia artificial y el futuro que se nos viene encima.","https://www.amazon.es/Blu-ray-Joaquin-Phoenix-Scarlett-Johansson/dp/B00ITO0NDI/ref=sr_1_1?__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=IT7FBHG90SLI&keywords=her+blu+ray&qid=1670709942&s=dvd&sprefix=her+bluray%2Cdvd%2C77&sr=1-1"),
            ProducTextil("Trabajo basura",R.drawable.basura,18.0f,"Comedia imprescindible para todos los que se pasan horas y horas en una oficina delante de un ordenador.","https://www.amazon.es/Trabajo-Basura-DVD-Ron-Livingston/dp/B0055KMEY0"),
            )
    }
}