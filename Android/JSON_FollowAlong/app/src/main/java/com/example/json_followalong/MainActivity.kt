package com.example.json_followalong

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.PersistableBundle
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.json_followalong.data.JSONdata
import com.example.json_followalong.model.PotterCharacter

class MainActivity : AppCompatActivity() {
    var potterList = ArrayList<PotterCharacter>()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        if(potterList.isEmpty()){
            val data = JSONdata()
            potterList = data.getJSON(this)
        }

        val recyclerView: RecyclerView = findViewById(R.id.recyclerView)
        recyclerView.addItemDecoration(DividerItemDecoration(this,LinearLayoutManager.VERTICAL))
        val adapter = MyListAdapter(potterList)
        recyclerView.adapter = adapter
        recyclerView.layoutManager = LinearLayoutManager(this, LinearLayoutManager.VERTICAL,false)
    }

    private fun itemClicked(item: PotterCharacter){

    }

    override fun onSaveInstanceState(outState: Bundle) {
        outState.putParcelableArrayList("potterlist",potterList)
        super.onSaveInstanceState(outState)
    }

    override fun onRestoreInstanceState(savedInstanceState: Bundle) {
        super.onRestoreInstanceState(savedInstanceState)
        potterList=savedInstanceState.getParcelable<PotterCharacter>("potterlist") as ArrayList<PotterCharacter>
    }
}