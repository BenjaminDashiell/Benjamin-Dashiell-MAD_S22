package com.example.lab8.util

import android.content.Context
import android.util.Log
import com.android.volley.Request
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley
import com.example.lab8.model.itemViewModel
import com.example.lab8.model.pokemonlistItem
import org.json.JSONException
import org.json.JSONObject

class JSONdata {
    fun loadJSON(context: Context, theitemViewModel: itemViewModel){
        val randomPokemonID = (1..897).random().toString()
        //val randomPokemonID = 5 //for testing double types
        val url = "https://pokeapi.co/api/v2/pokemon/"+randomPokemonID
        Log.i("API URL Called", url)

        // instantiate the Volley request queue
        val queue = Volley.newRequestQueue(context)

        // Request a string response from the provided URL.
        val request = StringRequest(
            Request.Method.GET, url,
            { response ->
                parseJSON(response, theitemViewModel)
            },
            {
                Log.e("RESPONSE", error("request failed"))
            }
        )

        // Add the request to the RequestQueue
        queue.add(request)
    }
    fun parseJSON(response: String, theitemViewModel: itemViewModel){
        //val pokemonItem = ArrayList<pokemonlistItem>()
        val statStrings = ArrayList<String>()
        var newPokemon: pokemonlistItem? = null

        try {
            val jsonObject = JSONObject(response)
            //println(jsonObject)

            val id = jsonObject.getInt("id")
            val name = jsonObject.getString("name").replaceFirstChar{it.uppercase()}
            //println(name)

            //process for retrieving stats
            val statsJSONArray = jsonObject.getJSONArray("stats")
            //println(statsJSONArray)
            for (indexCount in 0..5){
                var currentStatsIndex = statsJSONArray.getJSONObject(indexCount)
                var currentStatBaseValue = currentStatsIndex.getString("base_stat")
                var currentStatIndex = currentStatsIndex.getJSONObject("stat")
                var currentStatStringName = currentStatIndex.getString("name").uppercase()
                var finalString = currentStatStringName+": "+currentStatBaseValue
                //println(finalString)
                statStrings.add(finalString)
            }

            //process for retrieving types (1 or more)
            val typesJSONArray = jsonObject.getJSONArray("types")
            //println(typesJSONArray)
            val arrayLength= typesJSONArray.length()-1
            var typingString = ""
            for (indexCount in 0..arrayLength){
                var currentTypesIndex = typesJSONArray.getJSONObject(indexCount)
                var currentTypeIndex = currentTypesIndex.getJSONObject("type")
                var currentTypeName = currentTypeIndex.getString("name").replaceFirstChar{it.uppercase()}
                typingString += currentTypeName

                if(arrayLength != indexCount){ typingString+=" / " }
                //println(typingString)
            }
            typingString += " Type"

            //process for retrieving imageURL
            val spirtesJSONObject = jsonObject.getJSONObject("sprites")
            val imageURL = spirtesJSONObject.getString("front_default")
            //println(imageURL)

            //add pokemon
            newPokemon = pokemonlistItem(id, name,statStrings, typingString, imageURL)
            //pokemonItem.add(newPokemon)
        } catch (e: JSONException) {
            e.printStackTrace()
        }

        if (newPokemon != null) {
            theitemViewModel.add(newPokemon)
        }else{
            println("Pokemon was not added to the view model")
        }
        //theitemViewModel.updateList(pokemonItem)
    }
}