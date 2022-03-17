//
//  WordbankDataHandler.swift
//  Project_HumanBenchmark
//
//  Created by BenD on 3/15/22.
//

import Foundation

class WordbankDataLoader {
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
    
    func getWords() -> [String]{
        var words = [String]()
        for word in allData {
            words.append(word)
        }
        return words
    }
}
