//
//  DataLoader.swift
//  Lab2
//
//  Created by BenD on 1/30/22.
//

import Foundation

class GenreLoader {
    var allData = [videoGameGenre]()
    
    func loadData(filename: String){
        print(filename)
        if let pathURL = Bundle.main.url(forResource: filename, withExtension:  "plist") {
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                allData = try plistdecoder.decode([videoGameGenre].self, from: data)
            } catch {
                print("Unable to load Genre data")
            }
        }
        else{
            print("path not found")
        }
    }
    
    func getGenres() -> [String]{
        print("allData loaded", allData)
        var genres = [String]()
        for genre in allData {
            genres.append(genre.genre)
        }
        print("get genres array", genres)
        return genres
    }
}


class PlatformLoader {
    var allData = [videoGamePlatform]()
    
    func loadData(filename: String){
        if let pathURL = Bundle.main.url(forResource: filename, withExtension:  "plist") {
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                allData = try plistdecoder.decode([videoGamePlatform].self, from: data)
            } catch {
                print("Unable to load Platform data")
            }
        }
    }
    
    func getPlatforms() -> [String]{
        var platforms = [String]()
        for platform in allData {
            platforms.append(platform.platform)
        }
        print(platforms)
        return platforms
    }
}
