package com.example.lab7.sample

import com.example.lab7.R
import com.example.lab7.model.anime

object SampleData {
    val animeList = ArrayList<anime>()

    init {
        animeList.add(anime("Shield Hero Season 2", R.drawable.springanime1))
        animeList.add(anime("Love Is War Season 3", R.drawable.springanime2))
        animeList.add(anime("Spy x Family", R.drawable.springanime3))
        animeList.add(anime("Shikimori's Not Just a Cutie", R.drawable.springanime4))
        animeList.add(anime("Tomodachi Game", R.drawable.springanime5))
    }
}