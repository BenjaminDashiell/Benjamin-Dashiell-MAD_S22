package com.example.lab9

import io.realm.Realm
import io.realm.RealmConfiguration

class ListApplication: android.app.Application() {
    override fun onCreate() {
        super.onCreate()

        Realm.init(this)

        val realmConfig = RealmConfiguration.Builder().build()

        Realm.setDefaultConfiguration(realmConfig ) }
}