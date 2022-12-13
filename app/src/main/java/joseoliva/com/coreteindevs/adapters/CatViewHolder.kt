package joseoliva.com.coreteindevs.adapters

import android.view.View
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import joseoliva.com.coreteindevs.R
import joseoliva.com.coreteindevs.models.ProducTextil

class CatViewHolder(view: View): RecyclerView.ViewHolder(view) {
    val ivfotooferta = view.findViewById<ImageView>(R.id.ivoferta)
    val tvpreciooferta = view.findViewById<TextView>(R.id.tvpreciooferta)

    fun render(
        textilmodel: ProducTextil,
        onClickListener: (ProducTextil) -> Unit
    ){
        ivfotooferta.setImageResource(textilmodel.foto)
        tvpreciooferta.text = textilmodel.precio.toString() + "€"

        itemView.setOnClickListener {
            onClickListener(textilmodel)
        }

    }
}