//
//  Pokemon.swift
//  Lab5
//
//  Created by BenD on 2/24/22.
//

import Foundation

struct Pokemon: Decodable{
    let id: Int
    let name: String
    var stats: [statsDictionary]
    var types: [typesDictionary]
}

//From https://pokeapi.co site
//stats: Array of 6 dictionary items
    //each dictionary has:
        //base_stat: Int
        //effort: Int
        //stat: Dictionary of 2 strings (name, url)
struct statsDictionary: Decodable{
    let base_stat: Int
    let effort: Int
    let stat: statDictionary
}

struct statDictionary: Decodable{
    let name: String
    let url: String
}

//types: Array of 1-2 dictionary items
    //slot: Int
    //type: Dictionary of 2 strings (name, url)
struct typesDictionary: Decodable{
    let slot: Int
    let type: typeDictonary
}

struct typeDictonary: Decodable{
    let name: String
    let url: String
}
