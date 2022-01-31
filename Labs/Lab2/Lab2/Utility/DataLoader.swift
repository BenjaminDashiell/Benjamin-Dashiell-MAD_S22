//
//  DataLoader.swift
//  Lab2
//
//  Created by BenD on 1/30/22.
//

import Foundation

class GenreLoader {
    var allData = [String]()
    
    func loadData(filename: String){
        if let pathURL = Bundle.main.url(forResource: filename, withExtension:  "plist") {
            //print(pathURL)
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                allData = try plistdecoder.decode([String].self, from: data)
            } catch {
                print("Unable to load Genre data")
            }
        }
    }
    
    func getGenres() -> [String]{
        //print("allData loaded", allData)
        var genres = [String]()
        for genre in allData {
            genres.append(genre)
        }
        //print("get genres array", genres)
        return genres
    }
}


class PlatformLoader {
    var allData = [String]()

    func loadData(filename: String){
        if let pathURL = Bundle.main.url(forResource: filename, withExtension:  "plist") {
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                allData = try plistdecoder.decode([String].self, from: data)
            } catch {
                print("Unable to load Platform data")
            }
        }
    }

    func getPlatforms() -> [String]{
        var platforms = [String]()
        for platform in allData {
            platforms.append(platform)
        }
        //print(platforms)
        return platforms
    }
}
