//
//  DependentPicker_ViewController.swift
//  Lab2
//
//  Created by BenD on 1/30/22.
//

import UIKit

class DependentPicker_ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    //outlets
    @IBOutlet weak var videoGamePicker: UIPickerView!
    @IBOutlet weak var outputLabel: UILabel!
    
    //setup
    var genreData = GenreLoader()
    var platformData = PlatformLoader()
    var genres = [String]()
    var platforms = [String]()
    let genresComponent = 0
    let platformsComponent = 1
    let filename1 = "genres" //Note to self: Using "New Group" changed path of the file to Data/filename, since I put it there. So Dataloader was not able to access it at first.
    //update. This is valid for the do-catch, but the plist data isn't in the picker
    let filename2 = "platforms"
    
    //required procs
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == genresComponent {
            return genres.count
        } else {
            return platforms.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == genresComponent {
            return genres[row]
        } else {
            return platforms[row]
        }
    }

    //Dynamic update output text when picker option is selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let genreRow = pickerView.selectedRow(inComponent: genresComponent) //gets the selected row for the artist
        let platformRow = pickerView.selectedRow(inComponent: platformsComponent) //gets the selected row for the album
        outputLabel.text="You enjoy playing \(genres[genreRow]) games on \(platforms[platformRow])."
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genreData.loadData(filename: filename1)
        genres = genreData.getGenres()
        //platformData.loadData(filename: filename2)
        //platforms = platformData.getPlatforms()
        outputLabel.text = ""
    }
}
