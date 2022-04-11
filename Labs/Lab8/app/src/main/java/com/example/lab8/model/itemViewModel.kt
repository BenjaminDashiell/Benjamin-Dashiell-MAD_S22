package com.example.lab8.model

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel

class itemViewModel: ViewModel() {
    val pokemonitemList = MutableLiveData<ArrayList<pokemonlistItem>>()
    private var newPokemonitemList = ArrayList<pokemonlistItem>()

    fun add(item: pokemonlistItem){
        newPokemonitemList.add(item)
        pokemonitemList.value = newPokemonitemList
    }

    fun clear(){
        val emptyList = ArrayList<pokemonlistItem>()
        pokemonitemList.value = emptyList
        newPokemonitemList.clear()
    }

//    fun updateList(newList: ArrayList<pokemonlistItem>){
//        pokemonitemList.value = newList
//    }

//    fun getList(): MutableLiveData<ArrayList<pokemonlistItem>>{
//        return pokemonitemList
//    }
}