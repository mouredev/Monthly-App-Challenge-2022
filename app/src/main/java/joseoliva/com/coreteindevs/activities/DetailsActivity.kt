package joseoliva.com.coreteindevs.activities

import android.content.Intent
import android.net.Uri
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import androidx.appcompat.widget.Toolbar
import joseoliva.com.coreteindevs.R
import joseoliva.com.coreteindevs.databinding.ActivityDetailsBinding

class DetailsActivity : AppCompatActivity() {

    lateinit var binding: ActivityDetailsBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityDetailsBinding.inflate(layoutInflater)
        setContentView(binding.root)

        //inicio mi toolbar y sobreescribo los metodos necesarios (al final)
        val toolbar: Toolbar = binding.toolbar
        setSupportActionBar(toolbar)

        //recojo los datos del producto que me llega para mostrar
        val foto = intent.getIntExtra("foto",0)
        val precio = intent.getFloatExtra("precio",0f)
        val descripcion = intent.getStringExtra("descripcion")
        val url = intent.getStringExtra("url")

        //y los muestros en sus respectivos campos del xml
        binding.ivproducto.setImageResource(foto)
        binding.tvprecioproducto.text = precio.toString()
        binding.tvdescripcioproducto.text = descripcion

        //Parseo la url para poder pasarsela al boton
        binding.btncomprar.setOnClickListener {
            val uri: Uri = Uri.parse(url)
            val intent = Intent(Intent.ACTION_VIEW, uri)
            startActivity(intent)
        }

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
                val intent = Intent(this,MainActivity::class.java)
                startActivity(intent)
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
}