package com.example.lab7

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.ImageView
import android.widget.TextView

class DetailActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_detail)

        val name = intent.getStringExtra("name")
        val resourceID = intent.getIntExtra("resourceID", -1)

        val animeImage: ImageView = findViewById(R.id.imageViewAnime)
        animeImage.setImageResource(resourceID)
        val animeName: TextView = findViewById(R.id.textViewName)
        animeName.text = name
    }
}