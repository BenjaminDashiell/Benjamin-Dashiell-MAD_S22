package com.example.lab8.model

import org.json.JSONArray
import org.json.JSONObject

data class pokemonlistItem (
    var id: Int,
    var name: String,
    var stats: ArrayList<String>,
    var types: String,
    var imageURL: String
)
