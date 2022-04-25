package com.example.lab9.model

import io.realm.RealmObject
import io.realm.annotations.PrimaryKey

open class Item(@PrimaryKey var id: String, var quote: String, var quoteAuthor: String, var quoteYear: Int): RealmObject(){
    constructor(): this("", "", "", 0)
}