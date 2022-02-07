//
//  DataLoader.swift
//  Lab3
//
//  Created by BenD on 2/6/22.
//

import Foundation

class VideoGameDataLoader{
    var allData = [VideoGameData]()
    
    func loadData(filename: String){
        if let pathURL = Bundle.main.url(forResource: filename, withExtension: "plist"){
            //creates a property list decoder object
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                //decodes the property list
                allData = try plistdecoder.decode([VideoGameData].self, from: data)
            } catch {
                // handle error
                print("Unable to load data. Use breakpoints to find which try statement failed")
            }
        }
    }
    
    func getAllData() -> [VideoGameData]{
        return allData
    }
    
    func getGenres() -> [String]{
        var game = [String]()
        for currentGame in allData{
            game.append(currentGame.genre)
        }
        return game
    }
    
    func getGames(index:Int) -> [String] {
        //print("Index called on is: ", index)
        //print(allData)
        //print(allData[index])
        return allData[index].games
    }

    func addGame(index:Int, newGame:String, newIndex: Int){
        allData[index].games.insert(newGame, at: newIndex)
    }

    func deleteGame(index:Int, gameIndex: Int){
        allData[index].games.remove(at: gameIndex)
    }
}

