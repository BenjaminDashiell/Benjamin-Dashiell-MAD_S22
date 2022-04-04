package com.example.json_followalong.data

import android.content.Context
import android.util.Log
import com.example.json_followalong.R
import com.example.json_followalong.model.PotterCharacter
import org.json.JSONException
import org.json.JSONObject

class JSONdata {
    var characterList = ArrayList<PotterCharacter>()

    fun getJSON(context: Context): ArrayList<PotterCharacter>{
        var json = loadJSONFromRes(context)
        characterList = parseJSON(json)
        return characterList
    }

    fun loadJSONFromRes(context: Context): String{
        val inputStream = context.resources.openRawResource(R.raw.harrypotter)
        val jsonString = inputStream.bufferedReader().use{it.readText()}
        return jsonString
    }

    fun parseJSON(jsonString: String): ArrayList<PotterCharacter>{
        try{
            val jsonObject = JSONObject(jsonString)
            val characterArray = jsonObject.getJSONArray("characters")
            for (i in 0 until characterArray.length()){
                val item = characterArray.getJSONObject(i)
                val name = item.getString("name")
                val info = item.getString("info")
                val newCharacter = PotterCharacter(name,info)
                characterList.add(newCharacter)
            }
        }catch (e: JSONException){
            e.printStackTrace()
        }
        return characterList
    }
}