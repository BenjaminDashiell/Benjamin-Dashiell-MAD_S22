//
//  DataLoader.swift
//  music_new
//
//  Created by BenD on 1/20/22.
//

import Foundation

class DataLoader{
    var allData = [ArtistAlbums]()
    
    func loadData(filename: String){
        if let pathURL = Bundle.main.url(forResource: filename, withExtension: "plist"){
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                //decodes the property list
                allData = try plistdecoder.decode([ArtistAlbums].self, from: data)
            }catch{
                //handle error
                print("Cannot load data")
            }
        }
    }
}
