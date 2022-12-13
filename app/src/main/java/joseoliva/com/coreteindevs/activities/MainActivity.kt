package joseoliva.com.coreteindevs.activities

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import androidx.appcompat.widget.Toolbar
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.smarteist.autoimageslider.SliderView
import de.hdodenhof.circleimageview.CircleImageView
import joseoliva.com.coreteindevs.R
import joseoliva.com.coreteindevs.adapters.OfertasAdapter
import joseoliva.com.coreteindevs.adapters.SliderAdapter
import joseoliva.com.coreteindevs.databinding.ActivityMainBinding
import joseoliva.com.coreteindevs.models.Ofertas
import joseoliva.com.coreteindevs.providers.OfertasProvider

class MainActivity : AppCompatActivity() {

    lateinit var binding: ActivityMainBinding

    //variables para el slider
    lateinit var listaimagenesofertas: ArrayList<Int>
    lateinit var sliderView: SliderView
    lateinit var sliderAdapter: SliderAdapter

    //variables para los botones de categoria
    lateinit var catTextil: CircleImageView
    lateinit var catGadget: CircleImageView
    lateinit var catVideos: CircleImageView

    //variables para el rv de las ofertas
    lateinit var rvofertas: RecyclerView
    var listaofertas: MutableList<Ofertas> = OfertasProvider.listaOfertas.toMutableList()
    private var linearlayoutManagerOfertas = LinearLayoutManager(this,LinearLayoutManager.HORIZONTAL,false)
    private lateinit var adapterofertas: OfertasAdapter

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        //inicio mi toolbar y sobreescribo los metodos necesarios (al final)
        val toolbar: Toolbar = binding.toolbar
        setSupportActionBar(toolbar)

        //inicializo las var y paso unas imagenes a la lista manualmente para el slider
        sliderView = binding.sliderview
        listaimagenesofertas = ArrayList<Int>()
        listaimagenesofertas.add(R.drawable.reloj1)
        listaimagenesofertas.add(R.drawable.taza1)
        listaimagenesofertas.add(R.drawable.ready)
        listaimagenesofertas.add(R.drawable.calcetines1)

        //inicializo las var de las categorias
        catTextil = binding.ivtextil
        catGadget = binding.ivgadgets
        catVideos = binding.ivvideos

        catTextil.setOnClickListener{
            val intent = Intent(this,CategoriaActivity::class.java)
            intent.putExtra("categoria", "TEXTIL")
            startActivity(intent)
        }
        catGadget.setOnClickListener {
            val intent = Intent(this,CategoriaActivity::class.java)
            intent.putExtra("categoria", "GADGETS")
            startActivity(intent)
        }
        catVideos.setOnClickListener {
            val intent = Intent(this,CategoriaActivity::class.java)
            intent.putExtra("categoria", "VIDEOS")
            startActivity(intent)
        }

        //pongo aleatoriamente una oferta del dia cada vez que venga a estactividad
        val listaofertas: ArrayList<Int>
        listaofertas = arrayListOf(
            R.drawable.ofertabragas,
            R.drawable.ofertagorro,
            R.drawable.ofertaready,
            R.drawable.ofertareloj,
        )
        val numaleatorio = (0..3).random()
        binding.ivofertadia.setImageResource(listaofertas.get(numaleatorio))

        inicioSlider() //llamo a la funcion que inicia el slider
        inicioRVOfertas() //llamo a esta funcion para cargar el RecyclerView de las ofertas

    }

    private fun inicioSlider() {

        sliderAdapter = SliderAdapter(listaimagenesofertas)
        //pongo la direccion del slider(pasaran las fotos de izda a drcha)
        sliderView.autoCycleDirection = SliderView.LAYOUT_DIRECTION_INHERIT
        //paso el adapter al sliderview
        sliderView.setSliderAdapter(sliderAdapter)
        //paso el tiempo que quiero que dure cada imagen en el slider en segundos
        sliderView.scrollTimeInSec = 2
        //pongo que el slider sea automatico
        sliderView.isAutoCycle = true
        //hago que se inicie el slider automatico
        sliderView.startAutoCycle()
    }

    private fun inicioRVOfertas(){
        adapterofertas = OfertasAdapter(
            listaofertas = listaofertas,
            onClickListener = {ofertas -> onItemOfertaSelected(ofertas)}
        )
        rvofertas = binding.rvdestacados
        rvofertas.layoutManager = linearlayoutManagerOfertas
        rvofertas.adapter = adapterofertas
    }

    private fun onItemOfertaSelected(ofertas: Ofertas) {
        //Toast.makeText(this,"Has seleccionado ${ofertas.descripcion}",Toast.LENGTH_SHORT).show()
        val intent = Intent(this,DetailsActivity::class.java)
        //paso los detalles del producto que necesito en la otra actividad
        intent.putExtra("foto", ofertas.foto)
        intent.putExtra("precio", ofertas.precio)
        intent.putExtra("descripcion", ofertas.descripcion)
        intent.putExtra("url", ofertas.url)
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

                return  true
            }
            R.id.textil -> {
                val intent = Intent(this,CategoriaActivity::class.java)
                intent.putExtra("categoria", "TEXTIL")
                startActivity(intent)
                return  true
            }
            R.id.gadgets -> {
                val intent = Intent(this,CategoriaActivity::class.java)
                intent.putExtra("categoria", "GADGETS")
                startActivity(intent)
                return  true
            }
            R.id.videos -> {
                val intent = Intent(this,CategoriaActivity::class.java)
                intent.putExtra("categoria", "VIDEOS")
                startActivity(intent)
                return  true
            }

        }
        return super.onOptionsItemSelected(item)
    }

    @Override
    override fun onBackPressed() {

    }
}