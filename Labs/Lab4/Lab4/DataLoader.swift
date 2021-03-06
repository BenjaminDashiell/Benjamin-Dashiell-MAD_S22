//
//  DataLoader.swift
//  Lab4
//
//  Created by BenD on 2/19/22.
//

import Foundation

class DataLoader{
    var allData = [gameGenres]()
    
    func loadData(filename: String){
        if let pathURL = Bundle.main.url(forResource: filename, withExtension: "plist"){
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                allData = try plistdecoder.decode([gameGenres].self, from: data)
            } catch {
                print(error)
            }
        }
    }
    
    func getGenres() -> [String]{
        var genres = [String]()
        for genre in allData{
            genres.append(genre.genreName)
        }
        return genres
    }
    
    func getURL(index:Int) -> String {
        return allData[index].url
    }
}
