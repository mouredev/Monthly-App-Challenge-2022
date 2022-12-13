package joseoliva.com.coreteindevs.activities

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import android.widget.Toast
import androidx.appcompat.widget.Toolbar
import androidx.core.widget.addTextChangedListener
import androidx.recyclerview.widget.GridLayoutManager
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import joseoliva.com.coreteindevs.R
import joseoliva.com.coreteindevs.adapters.CatAdapter
import joseoliva.com.coreteindevs.adapters.OfertasAdapter
import joseoliva.com.coreteindevs.databinding.ActivityTextilBinding
import joseoliva.com.coreteindevs.models.Ofertas
import joseoliva.com.coreteindevs.models.ProducTextil
import joseoliva.com.coreteindevs.providers.GadgetProvider
import joseoliva.com.coreteindevs.providers.OfertasProvider
import joseoliva.com.coreteindevs.providers.TextilProvider
import joseoliva.com.coreteindevs.providers.VideosProvider

class CategoriaActivity : AppCompatActivity() {

    lateinit var binding: ActivityTextilBinding

    //variables para el rv de las distintas categorias
    //creo varias listas para dependiendo de la categoria elegida cargar una lista u otra
    lateinit var rvcat: RecyclerView
    var listatextil: MutableList<ProducTextil> = TextilProvider.listaTextil.toMutableList()
    var listagadgets: MutableList<ProducTextil> = GadgetProvider.listaGadgets.toMutableList()
    var listavideos: MutableList<ProducTextil> = VideosProvider.listaVideos.toMutableList()
    lateinit var listacat: MutableList<ProducTextil>
    private var linearlayoutManagerCat = GridLayoutManager(this, 3)
    private lateinit var adaptercat: CatAdapter
    private lateinit var cat: String

    //creo un array donde guardo las 3 imagenes de la "portada" de las categorias para luego poner la que corresponda segun elijamos
    lateinit var imgportadas: ArrayList<Int>

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityTextilBinding.inflate(layoutInflater)
        setContentView(binding.root)

        //inicio mi toolbar y sobreescribo los metodos necesarios (al final)
        val toolbar: Toolbar = binding.toolbar
        setSupportActionBar(toolbar)

        //recupero la categoria que he pulsado en la main activity para asi cargar una lista u otra
        cat = intent.getStringExtra("categoria").toString()

        //inicializo el array con las tres "portadas"
        imgportadas = arrayListOf(
            R.drawable.textil,
            R.drawable.gadgets,
            R.drawable.videos,
        )

        //iniciamos el recyclerview que en este caso es una grilla para mostrar los productos de 2 en 2
        //dependiendo la categoria seleccionada paso una lista u otra
        //var listacat: MutableList<ProducTextil>
        if (cat == "TEXTIL") {
            binding.ivcategoria.setImageResource(imgportadas.get(0))
            listacat = listatextil
            inicioRVCat(listacat)
        }
        if (cat == "GADGETS") {
            binding.ivcategoria.setImageResource(imgportadas.get(1))
            listacat = listagadgets
            inicioRVCat(listacat)
        }
        if (cat == "VIDEOS") {
            binding.ivcategoria.setImageResource(imgportadas.get(2))
            listacat = listavideos
            inicioRVCat(listacat)
        }

        //para que funcione el buscador
        binding.etbuscador.addTextChangedListener {
            val listaproducfiltrado = listacat.filter { producto ->
                producto.nombre.lowercase().contains(it.toString().lowercase())
            }
            adaptercat.updateListaFiltrada(listaproducfiltrado)
        }
    }

    private fun inicioRVCat(listacat: MutableList<ProducTextil>) {
        adaptercat = CatAdapter(
            listatextil = listacat, //cargo la lista que recibo
            onClickListener = { productos -> onItemProductoSelected(productos) }
        )
        rvcat = binding.rvcategorias
        rvcat.layoutManager = linearlayoutManagerCat
        rvcat.adapter = adaptercat
    }

    private fun onItemProductoSelected(producto: ProducTextil) {
        //Toast.makeText(this,"Has seleccionado ${producto.descripcion}",Toast.LENGTH_SHORT).show()
        val intent = Intent(this, DetailsActivity::class.java)
        //paso los detalles del producto que necesito en la otra actividad
        intent.putExtra("foto", producto.foto)
        intent.putExtra("precio", producto.precio)
        intent.putExtra("descripcion", producto.descripcion)
        intent.putExtra("url", producto.url)
        startActivity(intent)

    }

    //para poner menus en el toolbar sobreescribo estos dos metodos
    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        menuInflater.inflate(R.menu.mi_menu, menu)
        return super.onCreateOptionsMenu(menu)
    }

    //para indicar una accion al pulsar un item del menu
    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        when (item.itemId) {
            R.id.home -> {
                val intent = Intent(this, MainActivity::class.java)
                startActivity(intent)
                return true
            }
            R.id.textil -> {
                if (cat == "TEXTIL") {
                    return true
                } else {
                    val intent = Intent(this, CategoriaActivity::class.java)
                    intent.putExtra("categoria", "TEXTIL")
                    startActivity(intent)
                    return true
                }
            }
            R.id.gadgets -> {
                if (cat == "GADGETS") {
                    return true
                } else {
                    val intent = Intent(this, CategoriaActivity::class.java)
                    intent.putExtra("categoria", "GADGETS")
                    startActivity(intent)
                    return true
                }
            }
            R.id.videos -> {
                if (cat == "VIDEOS") {
                    return true
                } else {
                    val intent = Intent(this, CategoriaActivity::class.java)
                    intent.putExtra("categoria", "VIDEOS")
                    startActivity(intent)
                    return true
                }

            }

        }
        return super.onOptionsItemSelected(item)
    }
}