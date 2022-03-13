//
//  GameDataHandler.swift
//  Lab6
//
//  Created by BenD on 3/13/22.
//

import Foundation

class GameDataHandler {
    var gameData = [String]()

    func dataFileURL(_ filename:String) -> URL? {
        let urls = FileManager.default.urls(for:.documentDirectory, in: .userDomainMask)
        let url = urls.first?.appendingPathComponent(filename)
        return url
    }

    func loadData(fileName: String){
        let fileURL = dataFileURL(fileName)

        if FileManager.default.fileExists(atPath: (fileURL?.path)!){
            do {
                let data = try Data(contentsOf: fileURL!)
                let decoder = PropertyListDecoder()
                gameData = try decoder.decode([String].self, from: data)
            } catch {
                print("no file")
            }
        }else{
            print("file does not exist")
        }
    }

    func saveData(fileName: String){
        let fileURL = dataFileURL(fileName)
        do {
            let encoder = PropertyListEncoder()
            encoder.outputFormat = .xml
            let encodedData = try encoder.encode(gameData)
            try encodedData.write(to: fileURL!)
        } catch {
            print("write error")
        }
    }

    func getGames() -> [String]{
        return gameData
    }

    func addItem(newItem: String){
        gameData.append(newItem)
    }

    func deleteItem(index: Int){
        gameData.remove(at: index)
    }
}
