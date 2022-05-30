package com.example.list_followalong

import android.content.ClipData
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.EditText
import com.example.list_followalong.model.itemViewModel
import androidx.activity.viewModels
import androidx.appcompat.app.AlertDialog
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.list_followalong.model.listItem
import com.google.android.material.floatingactionbutton.FloatingActionButton
import com.google.android.material.snackbar.Snackbar
import java.util.*

class MainActivity : AppCompatActivity() {
    private val viewModel:itemViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val recyclerView: RecyclerView = findViewById(R.id.recyclerView)
        recyclerView.addItemDecoration(DividerItemDecoration(this, LinearLayoutManager.VERTICAL))
        recyclerView.layoutManager = LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false)
        val adapter = MyListAdapter(viewModel)
        recyclerView.adapter = adapter

        //create the observer
        viewModel.itemList.observe(this, Observer {
            adapter.update()
        })

        findViewById<FloatingActionButton>(R.id.fab).setOnClickListener { view -> //create alert dialog
            val dialog = AlertDialog.Builder(this)
            val editText = EditText(applicationContext) //add edit text to dialog dialog.setView(editText)

            //set OK action
            dialog.setPositiveButton(R.string.add) {dialog, which -> val newItem = editText.text.toString()
                if (!newItem.isEmpty()){
                    val newID = UUID.randomUUID().toString();
                    viewModel.add(listItem(newID, newItem))
                    Snackbar.make(view, R.string.itemAdded, Snackbar.LENGTH_LONG)
                        .setAction(R.string.action, null).show()
                    }
            }
            dialog.setNegativeButton(R.string.cancel) { dialog, which -> }
            dialog.show()
        }
    }


}