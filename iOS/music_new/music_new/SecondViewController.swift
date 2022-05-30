//
//  SecondViewController.swift
//  music_new
//
//  Created by BenD on 1/13/22.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    let genre = ["Country","Pop","Rock","Jazz","Classical"]
    let decade = ["1950s","1960s","1970s","1980s","1990s"]
    
    @IBOutlet weak var choiceLabel: UILabel!
    @IBOutlet weak var choicePicker: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component==0{
            return genre.count
        }
        else{
            return decade.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component==0{
            return genre[row]
        }
        else{
            return decade[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let genrerow = pickerView.selectedRow(inComponent:0)
        let decaderow = pickerView.selectedRow(inComponent:1)
        choiceLabel.text = "You like \(genre[genrerow]) from the \(decade[decaderow])!"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
