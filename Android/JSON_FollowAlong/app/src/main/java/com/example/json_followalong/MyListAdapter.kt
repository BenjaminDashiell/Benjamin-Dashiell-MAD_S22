package com.example.json_followalong

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ExpandableListView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.json_followalong.model.PotterCharacter

class MyListAdapter(private val characterList: ArrayList<PotterCharacter>, private val clickListener:(PotterCharacter)->Unit): RecyclerView.Adapter<MyListAdapter.viewHolder>(){
    class viewHolder(view: View):RecyclerView.ViewHolder(view){
        val itemTextView: TextView = view.findViewById(R.id.textView)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): viewHolder {
        val layoutInflater = LayoutInflater.from(parent.context)
        val itemViewHolder = layoutInflater.inflate(R.layout.list_item,parent,false)
        return viewHolder(itemViewHolder)
    }

    override fun onBindViewHolder(holder: viewHolder, position: Int) {
        val item = characterList[position]
        holder.itemTextView.text = item.name
    }

    override fun getItemCount() = characterList.size
}