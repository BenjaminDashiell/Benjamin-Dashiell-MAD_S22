//
//  Dataloader.swift
//  nav_followalong
//
//  Created by BenD on 2/1/22.
//

import Foundation
class ContinentsDataLoader{
    var allData = [ContinentsData]()
    func loadData(filename: String){
    if let pathURL = Bundle.main.url(forResource: filename,
    withExtension: "plist"){
        //creates a property list decoder object
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                //decodes the property list
                allData = try plistdecoder.decode([ContinentsData].self,
                from: data)
            } catch {
                // handle error
                print(error)
            }
        }
    }
    
    func getContinents() -> [String]{
        var continents = [String]()
        for item in allData{
            continents.append(item.continent)
        }
        return continents
    }
    
    func getCountries(index:Int) -> [String] {
        return allData[index].countries
    }
    
    func addCountry(index:Int, newCountry:String, newIndex: Int){
        //index of Country
        //newIndex is index of the newCountry we insert
        allData[index].countries.insert(newCountry, at: newIndex)
    }
    
    func deleteCountry(index:Int, countryIndex: Int){
        allData[index].countries.remove(at: countryIndex)
    }
}
