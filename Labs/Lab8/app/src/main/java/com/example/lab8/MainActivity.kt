package com.example.lab8

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.activity.viewModels
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.lab8.model.itemViewModel
import com.example.lab8.util.JSONdata
import com.google.android.material.floatingactionbutton.FloatingActionButton

class MainActivity : AppCompatActivity() {
    private val viewModel: itemViewModel by viewModels()
    private val loader = JSONdata()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        //only load the JSON data once per app lifetime
        if (viewModel.pokemonitemList.value == null){
            loadPokemon()
        }

        //get the recycler view
        val recyclerView: RecyclerView = findViewById(R.id.recyclerView)

        //set a layout manager on the recycler view
        recyclerView.layoutManager = LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false)

        //define an adapter
        val adapter = MyListAdapter(viewModel)

        //assign the adapter to the recycle view
        recyclerView.adapter = adapter

        //create the observer
        viewModel.pokemonitemList.observe(this, Observer {
            adapter.update()
        })

        findViewById<FloatingActionButton>(R.id.fab).setOnClickListener {
            viewModel.clear()
            loadPokemon()
        }
    }

    fun loadPokemon(){
        for (indexCount in 0..5){
            loader.loadJSON(this.applicationContext, viewModel)
        }
    }
}