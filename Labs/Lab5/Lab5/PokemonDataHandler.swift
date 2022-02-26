//
//  PokemonDataHandler.swift
//  Lab5
//
//  Created by BenD on 2/24/22.
//

import Foundation

class PokemonDataHandler{
    var randomPokemon: Pokemon!
    
    func loadjson() async {
        let randomPokemonID = String(Int.random(in: 1..<898))
        let apiLink = "https://pokeapi.co/api/v2/pokemon/"+randomPokemonID
        guard let urlPath = URL(string: apiLink)
            else {
                print("Url error. The randomPokemonID was " + randomPokemonID)
                return
            }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: urlPath, delegate: nil)
            guard (response as? HTTPURLResponse)?.statusCode == 200
                else {
                    print("File download error")
                    return
                }
            print("download complete")
            parsejson(data)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func parsejson (_ data: Data) {
        //print(data)
        do
        {
            let apiData = try JSONDecoder().decode(Pokemon.self, from: data)
            //print(apiData)
            randomPokemon = apiData
        }
        catch let jsonErr
        {
            print(jsonErr.localizedDescription)
            return
        }
    }

    func getRandomPokemon() -> Pokemon {
        return randomPokemon
    }
}
