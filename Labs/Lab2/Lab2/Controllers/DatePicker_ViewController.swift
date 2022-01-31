//
//  ColorPicker_ViewController.swift
//  Lab2
//
//  Created by BenD on 1/30/22.
//

import UIKit

class DatePicker_ViewController: UIViewController, UIPickerViewDelegate{
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var outputLabel: UILabel!
    
    let dateFormatter: DateFormatter = DateFormatter()
    let graduationDateString = "05-05-2022"
    var graduationDate = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateStyle = .short //Displays dates as MM/DD/YY
        graduationDate = dateFormatter.date(from: graduationDateString)!
        // Do any additional setup after loading the view.
        outputLabel.text=""
    }
    
    @IBAction func updateLabel(sender: UIDatePicker){
        let selectedDateString: String = dateFormatter.string(from: sender.date)
        let selectedDate = dateFormatter.date(from: selectedDateString)!
        let numberOfDays = countDays(selectedDate: selectedDate, graduationDate: graduationDate)
        
        if(numberOfDays<0){
            let nonNegativeDays = numberOfDays * -1
            outputLabel.text="You graduated \(nonNegativeDays) days ago!"
        }else if(numberOfDays==0){
            outputLabel.text="Congrats, today is your graduation day!"
        }else{
            outputLabel.text="You will graduate in \(numberOfDays) days!"
        }
    }
    
    private func countDays(selectedDate: Date, graduationDate: Date) -> Int {
        let amount = Calendar.current.dateComponents([.day], from: selectedDate, to: graduationDate)
        //print(amount)
        //print(amount.day!)
        return amount.day!
    }
    
    //citations for code snippets/references
    //https://developer.apple.com/documentation/uikit/uidatepicker
    //https://www.tutorialspoint.com/how-do-you-create-a-date-object-from-a-date-in-swift-xcode
    //https://www.hackingwithswift.com/forums/100-days-of-swiftui/getting-the-difference-between-two-dates-in-swiftui/3070
}
