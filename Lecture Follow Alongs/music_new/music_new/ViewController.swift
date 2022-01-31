//
//  ViewController.swift
//  music_new
//
//  Created by BenD on 1/13/22.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let genre = ["Country","Pop","Rock","Jazz","Classical"]
        
    //Outlets (First)
    @IBOutlet var musicPicker: UIPickerView!
    @IBOutlet var musicChoice: UILabel!
    
    //For UIPickerViewDelegate, UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genre.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genre[row]
    }
    
    //When a picker option is selected, we are dynamically update it through this function
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        musicChoice.text = "You like \(genre)!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

