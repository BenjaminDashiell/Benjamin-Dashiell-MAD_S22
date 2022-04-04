package com.example.lab7.model

import android.os.Parcelable
import kotlinx.android.parcel.Parcelize

@Parcelize
data class anime (val name: String, val imageResourceID: Int): Parcelable{}
