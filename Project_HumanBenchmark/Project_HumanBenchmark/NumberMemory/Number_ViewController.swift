//
//  Number_ViewController.swift
//  Project_HumanBenchmark
//
//  Created by BenD on 4/10/22.
//

import UIKit

class Number_ViewController: UIViewController, UITextFieldDelegate {
    //MARK: Variables and Outlets
    @IBOutlet weak var memorizeNumber: UILabel!
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var revealNumber: UIButton!
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var submitAnswer: UIButton!
    @IBOutlet weak var feedbackText: UILabel!
    
    let accessScores = Score.scoreInstance
    private var testNumber = 0
    private var timeToMemorize = 2 //2 secs
    private var digitMultipler = 0
    private var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        feedbackText.text = ""
        initGame()
    }
    
    private func initGame(){
        score = 0
        digitMultipler = 0
        timeToMemorize = 2
        initRound()
    }
    
    private func initRound(){
        memorizeNumber.text = "#"
        timer.text = "00:00"
        revealNumber.isEnabled=true
        submitAnswer.isEnabled=false
        userInput.isUserInteractionEnabled=false
    }
    
    //MARK: Step 1 - Reveal Test Number
    @IBAction func reveal(){
        feedbackText.text = ""
        
        //get random number
        //1..9
        //10..19
        //100...999
        let lowerBound = NSDecimalNumber(decimal: pow(10,digitMultipler)).intValue
        let upperBound = ((NSDecimalNumber(decimal: (pow(10,digitMultipler))).intValue)*10)-1
        let randomNumber = Int.random(in: lowerBound..<upperBound)
        
        //display random number for timeToMemorize secs
        revealNumber.isEnabled=false
        testNumber = randomNumber
        memorizeNumber.text=String(testNumber)
        recurUpdate(timeToMemorize)
    }
    
    private func recurUpdate(_ secsLeft: Int){
        if(secsLeft < 0){
            memorizeNumber.text = "#"
            submitAnswer.isEnabled=true
            userInput.isUserInteractionEnabled=true
            return
        }else{
            let dispatchAfter = DispatchTimeInterval.seconds(1)
            DispatchQueue.main.asyncAfter(deadline: .now() + dispatchAfter) {
                let secsSplit = self.totalSecsToTextFormat(secsLeft)
                let displayTimeLeft = self.makeTimeString(mins: secsSplit.0, secs: secsSplit.1)
                self.timer.text = displayTimeLeft
                self.recurUpdate(secsLeft-1)
            }
        }
    }
    
    //helper functions
    private func totalSecsToTextFormat(_ seconds: Int) -> (Int, Int){
            return (((seconds%3600)/60), ((seconds%3600)%60))
        }
    
    private func makeTimeString(mins: Int, secs: Int) -> String{
        var timeString = ""
        timeString += String(format: "%02d", mins)+":"
        timeString += String(format: "%02d", secs)
        return timeString
    }
    
    //MARK: Step 2 - Handle user submissions
    @IBAction func submit(){
        if(userInput.text != nil){
            let userValue = Int(userInput.text!)
            if userValue == testNumber{
                feedbackText.text!+="Correct. Press Reveal when you're ready for the next round"
                digitMultipler+=1
                timeToMemorize+=1 //1 more sec to memorize for 1 more digit
                score+=1
                userInput.text = "" //clear text field
                initRound()
            }else{
                accessScores.setNumberScore(score)
                
                let addalert = UIAlertController(title: "Game Over", message: "Your score was \(score) digits memorized. Would you like to play again?", preferredStyle: .alert)
                
                let replayAction = UIAlertAction(title: "Yes", style: .default, handler: {(UIAlertAction)in
                    self.initGame()
                })
                addalert.addAction(replayAction)
                
                let noReplayAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
                addalert.addAction(noReplayAction)
                
                present(addalert, animated: true, completion: nil)
            }
        }
    }
    
    //helpers for keyboard from textbook
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue{
            if self.view.frame.origin.y == 0 { self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) { if((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            if self.view.frame.origin.y != 0 { self.view.frame.origin.y = 0
            }
        }
    }
}
