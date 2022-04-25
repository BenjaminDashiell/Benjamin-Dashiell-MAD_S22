package com.example.lab9

import android.R.id
import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import android.widget.EditText
import android.widget.LinearLayout
import androidx.activity.viewModels
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.lab9.model.Item
import com.example.lab9.model.ItemViewModel
import com.google.android.material.floatingactionbutton.FloatingActionButton
import com.google.android.material.snackbar.Snackbar
import java.util.*


class MainActivity : AppCompatActivity() {
    private val viewModel: ItemViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        //get the recycler view
        val recyclerView: RecyclerView = findViewById(R.id.recyclerView)

        //divider line between rows
        recyclerView.addItemDecoration(DividerItemDecoration(this, LinearLayoutManager.VERTICAL))

        //set a layout manager on the recycler view
        recyclerView.layoutManager = LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false)

        //define an adapter
        val adapter = MyListAdapter(viewModel)

        //assign the adapter to the recycle view
        recyclerView.adapter = adapter

        findViewById<FloatingActionButton>(R.id.fab).setOnClickListener { view ->
            //create alert dialog
            val dialog = AlertDialog.Builder(this)
            //create edit texts
            val editText = EditText(applicationContext)
            val editText2 = EditText(applicationContext)
            val editText3 = EditText(applicationContext)

            //citation:
            // https://codengocool.hashnode.dev/android-how-to-create-multiple-edittext-inside-an-alert-dialog
            editText.setHint(R.string.addQuote)
            editText2.setHint(R.string.addAuthor)
            editText3.setHint(R.string.addYear)

            val layoutParams = LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT
            )
            layoutParams.setMargins(20, 20, 20, 20) //set margin

            val lp = LinearLayout(applicationContext)
            lp.orientation = LinearLayout.VERTICAL

            lp.addView(editText, layoutParams)
            lp.addView(editText2, layoutParams)
            lp.addView(editText3, layoutParams)

            dialog.setView(lp)
            dialog.setTitle(R.string.addTitle)

            dialog.setPositiveButton(R.string.add) {dialog, which ->
                val newQuote = editText.text.toString()
                val quoteAuthor = editText2.text.toString()
                val quoteYear = editText3.text.toString().toInt()
                if (!newQuote.isEmpty() && !quoteAuthor.isEmpty()){
                    val newID = UUID.randomUUID().toString();
                    //add item
                    viewModel.add(Item(newID, newQuote, quoteAuthor, quoteYear))
                    Snackbar.make(view, R.string.itemAdded, Snackbar.LENGTH_LONG)
                        .setAction(R.string.action, null).show()
                }
            }
            //sets cancel action
            dialog.setNegativeButton(R.string.cancel) { dialog, which ->
                //cancel
            }
            dialog.show()
        }

        //create the observer
        viewModel.itemList.observe(this,Observer{
            adapter.update()
        })
    }

    override fun onCreateOptionsMenu(menu: Menu): Boolean {
        menuInflater.inflate(R.menu.options_menu, menu)
        return true
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        return when (item.itemId) {
            R.id.action_deleteAll -> {
                viewModel.deleteAll()
                true
            }
            else -> super.onOptionsItemSelected(item)
        }
    }
}