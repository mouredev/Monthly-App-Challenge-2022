package joseoliva.com.coreteindevs.providers

import joseoliva.com.coreteindevs.R
import joseoliva.com.coreteindevs.models.ProducTextil

class GadgetProvider {
    companion object{
        val listaGadgets = listOf<ProducTextil>(
            ProducTextil("reloj",R.drawable.relojbinario1,26.80f,"Magnífico reloj binario especialmente diseñado para los programadores mas frikis.","https://www.amazon.es/dp/B00FBEO8DU?tag=informatico-ninja-21&linkCode=osi&th=1&psc=1&keywords=Reloj%20binario"),
            ProducTextil("taza",R.drawable.taza,25.64f,"Estupenda taza de cerámica que te hará sentir el más grande de los programadores..","https://www.amazon.es/MoonWorks%C2%AE-Codefather-Programador-Informatiker-regalo/dp/B07N1149FH/ref=sr_1_5?crid=1Y8YIRR8L43VD&keywords=regalos%2Bprogramadores&qid=1670426247&s=kitchen&sprefix=programadores%2Ckitchen%2C133&sr=1-5&th=1"),
            ProducTextil("pegatinas",R.drawable.pegatinas,7.88f,"Adorna tu portátil con estas maravillosas pegatinas devs","https://www.amazon.es/dp/B09MRW941Y?tag=informatico-ninja-21&linkCode=osi&th=1&keywords=Pegatinas+programadores"),
            ProducTextil("reposapies",R.drawable.reposapies,29.99f,"Nunca más tendrás los pies agotados y notarás el relax mientras programas...","https://www.amazon.es/dp/B09V7WWSWM/ref=sspa_dk_detail_1?psc=1&pd_rd_i=B09V7WWSWM&pd_rd_w=a9Afn&content-id=amzn1.sym.4bd66532-7b33-429c-b5f3-8f37d2eceaa2&pf_rd_p=4bd66532-7b33-429c-b5f3-8f37d2eceaa2&pf_rd_r=TV2451ZHWDBPGTPQ1GA2&pd_rd_wg=rG38L&pd_rd_r=96fa74b1-6d85-4ed1-9cd2-c27bfb2427f6&s=kitchen&sp_csd=d2lkZ2V0TmFtZT1zcF9kZXRhaWw"),
            ProducTextil("posavasos",R.drawable.posavasos,19.99f,"Original posavasos para que tus tazas no se deslicen sobre la mesa...","https://www.etsy.com/es/listing/927893784/el-original-juego-de-2-posavasos-para?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=regalo+programador&ref=sr_gallery-1-13&etp=1&col=1&sts=1&organic_search_click=1"),
            ProducTextil("abrebotellas",R.drawable.abrebotellas,7.49f,"Porque siempre nos quedará una cervecita entre función y función...","https://www.etsy.com/es/listing/1037043296/abrebotellas-para-programadores?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=regalo+programador&ref=sr_gallery-1-26&organic_search_click=1"),
            ProducTextil("reloj",R.drawable.relojdiscoduro,39.81f,"Un capricho para no llegar nunca tarde!","https://www.etsy.com/es/listing/1256738896/reloj-de-disco-duro-pc-gamer-boyfriend?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=regalo+programador&ref=sc_gallery-3-18&sts=1&plkey=ee107a2c9248f8a745f266c1dac3119c8dbd2577%3A1256738896"),
            ProducTextil("Altavoz Harry Potter",R.drawable.altavoz,25.11f,"Mini altavoz perfecto  para decorar tu escritorio.","https://lafrikileria.com/es/descatalogado/25490-mini-altavoz-bluetooth-harry-potter-kawaii-0092298948775.html"),
            ProducTextil("Funko Dead Pool",R.drawable.funko,32.90f,"Rodarán cabezas cada vez que te atasques programando! Imprescindible en tu escritorio.","https://lafrikileria.com/es/descatalogado/6824-figura-deadpool-cabezon-head-knocker-634482615027.html"),
            ProducTextil("chupitos",R.drawable.chupitos,32.90f,"De vez en cuando habrá que pararse a celebrar ese código que parecía imposible!","https://lafrikileria.com/es/merchandising-juego-de-tronos/9923-pack-chupitos-fuego-valyrio-juego-de-tronos-0827153890315.html"),

        )
    }
}