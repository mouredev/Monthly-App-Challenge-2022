package joseoliva.com.coreteindevs.providers

import joseoliva.com.coreteindevs.R
import joseoliva.com.coreteindevs.models.Ofertas

//esta clase nos provee de los items que creemos para las ofertas (en este caso los creamos manualmente y no proceden de bbdd ni nada de eso)
class OfertasProvider {
    companion object{
        val listaOfertas = listOf<Ofertas>(
            Ofertas("reloj",R.drawable.relojbinario1,26.80f,"Magnífico reloj binario especialmente diseñado para los programadores mas frikis.","https://www.amazon.es/dp/B00FBEO8DU?tag=informatico-ninja-21&linkCode=osi&th=1&psc=1&keywords=Reloj%20binario"),
            Ofertas("taza",R.drawable.taza,25.64f,"Estupenda taza de cerámica que te hará sentir el más grande de los programadores..","https://www.amazon.es/MoonWorks%C2%AE-Codefather-Programador-Informatiker-regalo/dp/B07N1149FH/ref=sr_1_5?crid=1Y8YIRR8L43VD&keywords=regalos%2Bprogramadores&qid=1670426247&s=kitchen&sprefix=programadores%2Ckitchen%2C133&sr=1-5&th=1"),
            Ofertas("calcetines",R.drawable.calcetines,9.99f,"Calcetines 100% de algodón para estar calentito en las frías noches en la que todo sale mal.","https://www.etsy.com/es/listing/1240494866/calcetines-geniales-para-empleados-de-ti?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=regalo+programador&ref=sr_gallery-1-4&bes=1&sts=1&organic_search_click=1"),
            Ofertas("ready player one",R.drawable.readyplayer,11.95f,"Ningún programador puede pasar sin ver ésta obra de la literatura llevada al cine por el gran Steven Spielberg","https://www.amazon.es/Ready-Player-One-Blu-ray-Sheridan/dp/B08V9TGH2P/ref=asc_df_B08V9TGH2P/?tag=googshopes-21&linkCode=df0&hvadid=469132743785&hvpos=&hvnetw=g&hvrand=18210732397736572269&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=1005493&hvtargid=pla-1188796705393&psc=1"),
            Ofertas("pegatinas",R.drawable.pegatinas,7.88f,"Adorna tu portátil con estas maravillosas pegatinas devs","https://www.amazon.es/dp/B09MRW941Y?tag=informatico-ninja-21&linkCode=osi&th=1&keywords=Pegatinas+programadores"),
            Ofertas("sudadera",R.drawable.sudadera2,59.59f,"Nunca olvides los tres mandamientos del buen programador...","https://www.etsy.com/es/listing/968134724/eat-sleep-code-repetir-sudadera-con?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=programmer+hoodie&ref=sr_gallery-1-14&pro=1&col=1&sts=1&organic_search_click=1"),
            Ofertas("bragas",R.drawable.bragas,23.94f,"Bragas para asombrar en tus citas o simplemente para recordar quien eres de la manera más cómoda.","https://www.etsy.com/es/listing/1092884896/bragas-para-programadores-de"),
        )
    }
}