package joseoliva.com.coreteindevs.adapters

import android.view.View
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import joseoliva.com.coreteindevs.R
import joseoliva.com.coreteindevs.models.Ofertas

class OfertasViewHolder(view: View): RecyclerView.ViewHolder(view) {

    val ivfotooferta = view.findViewById<ImageView>(R.id.ivoferta)
    val tvpreciooferta = view.findViewById<TextView>(R.id.tvpreciooferta)

    fun render(
        ofertamodel: Ofertas,
        onClickListener: (Ofertas) -> Unit
    ){
        ivfotooferta.setImageResource(ofertamodel.foto)
        tvpreciooferta.text = ofertamodel.precio.toString() + "€"

        itemView.setOnClickListener {
            onClickListener(ofertamodel)
        }

    }
}