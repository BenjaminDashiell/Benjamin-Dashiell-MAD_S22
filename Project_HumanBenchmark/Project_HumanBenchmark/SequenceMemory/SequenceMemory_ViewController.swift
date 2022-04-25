//
//  SequenceMemory_ViewController.swift
//  Project_HumanBenchmark
//
//  Created by BenD on 3/15/22.
//

import UIKit

enum buttonState{
    case displayOnly //not allow button inputs
    case active //allow button inputs
}

class SequenceMemory_ViewController: UIViewController {
    // MARK: Setup (Variables/Outlets)
    var level = 1
    var pattern = [Int]()
    var current_index = 0
    var currentButtonState: buttonState = .displayOnly
    var buttonTintToChange: UIButton?
    
    let accessScores = Score.scoreInstance
    
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
        initSequenceGame()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //After viewDidLoad
        buttonEnabled(false)
        addToPattern()
    }
    
    // MARK: Running Mini-game
    private func initSequenceGame(){
        level = 1
        pattern.removeAll()
        current_index = 0
        levelCounter.text = "Level: \(level)"
        currentButtonState = .displayOnly
        buttonOne.backgroundColor = .systemBlue
        buttonTwo.backgroundColor = .systemBlue
        buttonThree.backgroundColor = .systemBlue
        buttonFour.backgroundColor = .systemBlue
        buttonFive.backgroundColor = .systemBlue
        buttonSix.backgroundColor = .systemBlue
        buttonSeven.backgroundColor = .systemBlue
        buttonEight.backgroundColor = .systemBlue
        buttonNine.backgroundColor = .systemBlue
        
    }
    
    private func addToPattern(){
        let newIndex = randomIndex()
        pattern.append(newIndex)
        recurPlaySequence(current_index)
    }
    
    private func recurPlaySequence(_ ind: Int){
        print("sequence amount: ", pattern.count)
        print("current index:", ind)
        guard ind < pattern.count else{
            currentButtonState = .active
            buttonEnabled(true)
            current_index = 0 //reset for userSelection
            return
        }
        
        //If error was not found, which is accessing an index outside an array, show the pattern and recursive call
        buttonTintToChange = buttonFromIndexID(pattern[ind])
        print("color will change to white")
        buttonTintToChange!.backgroundColor = .white
        
        //change
        let dispatchAfter = DispatchTimeInterval.seconds(2) //2 secs before changing the color of the current
        DispatchQueue.main.asyncAfter(deadline: .now() + dispatchAfter){
            print("color will change to blue")
            self.buttonTintToChange!.backgroundColor = .systemBlue
            print("current_index in Dispatch", self.current_index)
            self.current_index+=1
            self.recurPlaySequence(self.current_index)
        }
    }
    
    @IBAction func userSelection(_ sender: UIButton) {
        //only allow userSelection code to run if in .active state
        if(currentButtonState == .active){
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
                    currentButtonState = .displayOnly
                    buttonEnabled(false)
                    addToPattern()
                }
            }
            else{
                print("The Game Has Ended. Your score was \(level)")
                buttonEnabled(false)
                //game ends, send score to next vc
                accessScores.setSequenceScore(level)
                
                let addalert = UIAlertController(title: "Game Over", message: "Your score was \(level) digits memorized. Would you like to play again?", preferredStyle: .alert)
                
                let replayAction = UIAlertAction(title: "Yes", style: .default, handler: {(UIAlertAction)in
                    self.initSequenceGame()
                    self.addToPattern()
                })
                addalert.addAction(replayAction)
                
                let noReplayAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
                addalert.addAction(noReplayAction)
                
                present(addalert, animated: true, completion: nil)
            }
        }
    }
    
    // MARK: Helper Functions
    private func buttonEnabled(_ enabledState: Bool){
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
