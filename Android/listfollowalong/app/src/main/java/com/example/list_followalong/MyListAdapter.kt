package com.example.list_followalong

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.list_followalong.model.itemViewModel

class MyListAdapter(private val itemViewModel:itemViewModel): RecyclerView.Adapter<MyListAdapter.ViewHolder>(){
    class ViewHolder(view: View): RecyclerView.ViewHolder(view){
        val itemTextView: TextView = view.findViewById(R.id.textView)
    }

    private var myItemList = itemViewModel.itemList.value

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val layoutInflater = LayoutInflater.from(parent.context)
        val itemViewHolder = layoutInflater.inflate(R.layout.list_item, parent,
            false)
        return ViewHolder(itemViewHolder)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val item = myItemList?.get(position)
        holder.itemTextView.text = item?.name ?: ""
    }

    override fun getItemCount(): Int {
        if (myItemList != null) {
            return myItemList!!.size
        }
        else return 0
    }

    fun update(){
        myItemList = itemViewModel.itemList.value
        notifyDataSetChanged()
    }
}