//
//  SequenceMemory_ViewController.swift
//  Project_HumanBenchmark
//
//  Created by BenD on 3/15/22.
//

import UIKit

class SequenceMemory_ViewController: UIViewController {
    // MARK: Setup (Variables/Outlets)
    var level = 1
    var pattern = [Int]()
    var current_index = 0
    
    @IBOutlet weak var levelCounter: UILabel!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonSix: UIButton!
    @IBOutlet weak var buttonSeven: UIButton!
    @IBOutlet weak var buttonEight: UIButton!
    @IBOutlet weak var buttonNine: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        level = 1
        pattern.removeAll()
        current_index = 0
        levelCounter.text = "Level: \(level)"
    }
    override func viewDidAppear(_ animated: Bool) {
        //After viewDidLoad
        playSequence()
    }
        
    // MARK: Running Mini-game
    private func playSequence(){
        //disable buttons and prevent taking user input
        buttonState(false)
        
        //get new index for the pattern
        let newIndex = randomIndex()
        pattern.append(newIndex)
        
        //delay animation for 1.5 sec
        sleep(UInt32(1.5))
        print("For testing: the pattern is ")
        for ind in self.pattern{
            print(ind)
            let buttonTintToChange = buttonFromIndexID(1) //for testing
            //let buttonTintToChange = buttonFromIndexID(ind)
            print("color will change to white")
            buttonTintToChange.setTitleColor(UIColor.white, for: UIControl.State.normal) //I'm trying to figure out how to change the color of a button that isn't pressed. This is only seen when the button is pressed
            sleep(UInt32(3.0))
            //delay re-enable for 1.5 sec
            print("color will change to blue")
            buttonTintToChange.backgroundColor = .systemBlue
        }
        
        //delay re-enable for 1.5 sec
        sleep(UInt32(4.5))
        //re-enable buttons and allow user input
        buttonState(true)
    }
        
    @IBAction func userSelection(_ sender: UIButton) {
        let tagID = sender.tag
        print("Tag: ", tagID)
        print("Compare", pattern[current_index])
        if tagID == pattern[current_index]{
            //print("User has selected the right button")
            if current_index != pattern.count-1{
                current_index += 1
            }else{
                level += 1
                levelCounter.text = "Level: \(level)"
                current_index = 0
                //print("New Sequence Starting")
                playSequence()
            }
        }
        else{
            print("The Game Has Ended. Your score was \(level)")
            //disable buttons
            buttonState(false)
            //game ends, send score to next vc
        }
    }
    
    // MARK: Helper Functions
    private func buttonState(_ enabledState: Bool){
        buttonOne.isEnabled = enabledState
        buttonTwo.isEnabled = enabledState
        buttonThree.isEnabled = enabledState
        buttonFour.isEnabled = enabledState
        buttonFive.isEnabled = enabledState
        buttonSix.isEnabled = enabledState
        buttonSeven.isEnabled = enabledState
        buttonEight.isEnabled = enabledState
        buttonNine.isEnabled = enabledState
    }
    
    private func buttonFromIndexID(_ index: Int)-> UIButton{
        switch(index){
            case 1:
                return buttonOne
            case 2:
                return buttonTwo
            case 3:
                return buttonThree
            case 4:
                return buttonFour
            case 5:
                return buttonFive
            case 6:
                return buttonSix
            case 7:
                return buttonSeven
            case 8:
                return buttonEight
            case 9:
                return buttonNine
            default:
                let defaultButton = UIButton()
                return defaultButton
        }
    }
    
    private func randomIndex() -> Int{
        let number = Int.random(in: 1..<10)
        //print(number)
        return number
    }
}
