package joseoliva.com.coreteindevs.adapters

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import joseoliva.com.coreteindevs.R
import joseoliva.com.coreteindevs.models.ProducTextil

class CatAdapter (
    private var listatextil: List<ProducTextil>,
    private val onClickListener: (ProducTextil) -> Unit
): RecyclerView.Adapter<CatViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CatViewHolder {
        val layoutInflater = LayoutInflater.from(parent.context)
        return CatViewHolder(layoutInflater.inflate(R.layout.item_oferta,parent,false))
    }

    override fun onBindViewHolder(holder: CatViewHolder, position: Int) {
        val item = listatextil[position]
        holder.render(item,onClickListener)
    }

    override fun getItemCount(): Int = listatextil.size


    fun updateListaFiltrada(listaproducfiltrado: List<ProducTextil>) {
        this.listatextil = listaproducfiltrado
        notifyDataSetChanged()
    }
}