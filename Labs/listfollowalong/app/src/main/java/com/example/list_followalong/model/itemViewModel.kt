package com.example.list_followalong.model

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel

class itemViewModel: ViewModel() {
    //wrapping our arraylist of listitems in  mutablelivedata
    val itemList = MutableLiveData<ArrayList<listItem>>()
    private var newList = ArrayList<listItem>()

    fun add(item: listItem){
        newList.add(item)
        itemList.value = newList
    }
    fun delete(item: listItem){
        newList.remove(item)
        itemList.value = newList
    }
}