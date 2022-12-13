package joseoliva.com.coreteindevs.adapters

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import com.bumptech.glide.Glide
import com.smarteist.autoimageslider.SliderViewAdapter
import joseoliva.com.coreteindevs.R

class SliderAdapter(imagenes: ArrayList<Int>):
    SliderViewAdapter<SliderAdapter.SliderViewHolder>(){

    //creo una lista que sera la lista de imagenes que recibimos por parametro
    var listaimagenes: ArrayList<Int> = imagenes

    override fun getCount(): Int = listaimagenes.size

    override fun onCreateViewHolder(parent: ViewGroup?): SliderViewHolder {
        val inflate: View = LayoutInflater.from(parent!!.context).inflate(R.layout.slider_item,null)
        return SliderViewHolder(inflate)
    }

    override fun onBindViewHolder(viewHolder: SliderViewHolder?, position: Int) {
        if(viewHolder != null){
            //si hay elementos, cargamos las fotos de la lista en el slider
            Glide.with(viewHolder.itemView)
                .load(listaimagenes.get(position))
                .fitCenter()
                .into(viewHolder.imageView)
        }
    }

    inner class SliderViewHolder(itemView: View?): SliderViewAdapter.ViewHolder(itemView){
        var imageView: ImageView = itemView!!.findViewById(R.id.myimage)
    }
}