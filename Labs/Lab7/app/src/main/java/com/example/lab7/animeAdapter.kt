package com.example.lab7

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.lab7.animeAdapter.ViewHolder
import com.example.lab7.model.anime

class animeAdapter(private val animeList: ArrayList<anime>, private val clickListener:(anime) -> Unit): RecyclerView.Adapter<ViewHolder>() {
    class ViewHolder(view: View): RecyclerView.ViewHolder(view) {
        val animeTextView: TextView = view.findViewById(R.id.textView)
    }
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val layoutInflater = LayoutInflater.from(parent.context)
        val itemViewHolder = layoutInflater.inflate(R.layout.list_item, parent, false)
        return ViewHolder(itemViewHolder)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val anime = animeList[position]
        holder.animeTextView.text = anime.name
        holder.itemView.setOnClickListener{clickListener(anime)}
    }

    override fun getItemCount() = animeList.size
}