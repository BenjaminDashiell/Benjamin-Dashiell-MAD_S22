package com.example.lab8

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.lab8.model.itemViewModel
import com.squareup.picasso.Picasso

class MyListAdapter(private val theitemViewModel: itemViewModel): RecyclerView.Adapter<MyListAdapter.ViewHolder>() {
    private var myPokemonList = theitemViewModel.pokemonitemList.value

    class ViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        val PKtitleTextView: TextView = view.findViewById(R.id.pokemonTextView)
        val PKtypeTextView: TextView = view.findViewById(R.id.pokemonTypeView)
        val PKhpTextView: TextView = view.findViewById(R.id.pokemonHPView)
        val PKatkTextView: TextView = view.findViewById(R.id.pokemonATKView)
        val PKdefTextView: TextView = view.findViewById(R.id.pokemonDEFView)
        val PKspecatkTextView: TextView = view.findViewById(R.id.pokemonSPECATKView)
        val PKspecdefTextView: TextView = view.findViewById(R.id.pokemonSPECDEFView)
        val PKspeedTextView: TextView = view.findViewById(R.id.pokemonSpeedView)
        val PKimageView: ImageView = view.findViewById(R.id.imageView)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val layoutInflater = LayoutInflater.from(parent.context)
        val itemViewHolder = layoutInflater.inflate(R.layout.pokemon_list_item, parent, false)
        return ViewHolder(itemViewHolder)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val pokemon = myPokemonList?.get(position)
        holder.PKtitleTextView.text = pokemon?.name ?: "Filler Name"
        holder.PKtypeTextView.text = pokemon?.types ?: "Filler Type"
        holder.PKhpTextView.text = pokemon?.stats?.get(0) ?: "HP: 0"
        holder.PKatkTextView.text = pokemon?.stats?.get(1) ?: "ATK: 0"
        holder.PKdefTextView.text = pokemon?.stats?.get(2) ?: "DEF: 0"
        holder.PKspecatkTextView.text = pokemon?.stats?.get(3) ?: "SPECIAL ATK: 0"
        holder.PKspecdefTextView.text = pokemon?.stats?.get(4) ?: "SPECIAL DEF: 0"
        holder.PKspeedTextView.text = pokemon?.stats?.get(5) ?: "SPEED: 0"

        //load image using Picasso
        Picasso.get().load(pokemon?.imageURL ?: "")
            .error(R.drawable.error)
            .placeholder(R.drawable.pokeball)
            .into(holder.PKimageView);
    }

    override fun getItemCount(): Int {
        if (myPokemonList != null) {
            return myPokemonList!!.size
        } else return 0
    }

    fun update() {
        myPokemonList = theitemViewModel.pokemonitemList.value
        notifyDataSetChanged()
    }
}