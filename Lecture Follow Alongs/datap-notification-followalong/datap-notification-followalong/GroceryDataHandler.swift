//
//  GroceryDataHandler.swift
//  datap-notification-followalong
//
//  Created by BenD on 2/24/22.
//

import Foundation

class GroceryDataHandler{
    var groceryData = [String]()
    
    func dataFileURL(_ filename: String) -> URL? {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.first?.appendingPathComponent(filename) //array of urls
        return url
    }
    
    func loadData(fileName: String){
        let fileUrl = dataFileURL(fileName)
        if FileManager.default.fileExists(atPath: (fileUrl?.path)!){
            do{
                let data = try Data(contentsOf: fileUrl!)
                let decoder = PropertyListDecoder()
                groceryData = try decoder.decode([String].self, from: data)
            }
            catch{
                print("no file")
            }
        }
        else{
            print("file doesn't exist")
        }
    }
    
    func saveData(fileName: String){
        let fileUrl = dataFileURL(fileName)
        do{
            let encoder = PropertyListEncoder()
            encoder.outputFormat = .xml
            let encodedData = try encoder.encode(groceryData)
            try encodedData.write(to: fileUrl!)
        }
        catch{
            print("writing error")
        }
    }
    
    func getGroceryItems() -> [String]{
        return groceryData
    }
    func addItem(newItem: String){
        groceryData.append(newItem)
    }
    func deleteItem(index: Int){
        groceryData.remove(at: index)
    }
}
