package joseoliva.com.coreteindevs.adapters

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import joseoliva.com.coreteindevs.R
import joseoliva.com.coreteindevs.models.Ofertas

class OfertasAdapter(
    private var listaofertas: List<Ofertas>,
    private val onClickListener: (Ofertas) -> Unit
): RecyclerView.Adapter<OfertasViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): OfertasViewHolder {
        val layoutInflater = LayoutInflater.from(parent.context)
        return OfertasViewHolder(layoutInflater.inflate(R.layout.item_oferta,parent,false))
    }

    override fun onBindViewHolder(holder: OfertasViewHolder, position: Int) {
        val item = listaofertas[position]
        holder.render(item,onClickListener)
    }

    override fun getItemCount(): Int = listaofertas.size
}