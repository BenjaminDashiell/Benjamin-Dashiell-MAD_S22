//
//  Reaction_ViewController.swift
//  Project_HumanBenchmark
//
//  Created by BenD on 4/10/22.
//

import UIKit

enum state{
    case wait //red
    case startTimer //green
    case invalidTap //yellow
    case stopTimer //blue
    case end //blue
}

class Reaction_ViewController: UIViewController {
    @IBOutlet weak var reactionView: UIView!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var mainTextLabel: UILabel!
    @IBOutlet weak var feedbackTextLabel: UILabel!
    
    private var totalMS = 0
    private var roundCount = 0
    private var currentState: state?
    
    let timerInstance = timerClass()
    let accessScores = Score.scoreInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        initalizeGame()
    }
    
    private func initalizeGame(){
        currentState = .wait
        totalMS = 0
        roundCount = 0
        startRound()
    }
    
    private func averageMS() -> Int{
        return Int(totalMS/5)
    }
    
    private func startRound(){
        stateSwitch(currentState!)
        let randomSecs = Int.random(in: 3..<10) //1-2 secs was too fast
        let dispatchAfter = DispatchTimeInterval.seconds(randomSecs)
        DispatchQueue.main.asyncAfter(deadline: .now() + dispatchAfter) {
            self.currentState = .startTimer
            self.stateSwitch(self.currentState!)
        }
    }
    
    @IBAction func detectUserTap(_ sender: UITapGestureRecognizer) {
        tappedAction()
    }

    private func tappedAction(){
        //user tapped screen while in wait state
        if currentState! == .wait{
            //go to invalidTap state
            currentState = .invalidTap
            stateSwitch(currentState!)
        }
        //user tapped screen during invalidTap state
        else if currentState! == .invalidTap{
            //go to wait state
            currentState = .wait
            stateSwitch(currentState!)
        }
        //user tapped screen during stopTimer state
        else if currentState! == .stopTimer{
            //go to wait state if not in final round
            if(roundCount < 5){
                currentState = .wait
                roundCount+=1
                
                //if lives is NOW 5
                if roundCount >= 5{
                    currentState = .end
                    stateSwitch(currentState!)
                    
                    print(averageMS())
                    accessScores.setReactionScore(averageMS())
                    
                    //player has no lives and prompted with an alert
                    let addalert = UIAlertController(title: "Game Over", message: "Your score was \(averageMS()) milliseconds. Would you like to play again?", preferredStyle: .alert)
                                        
                    let replayAction = UIAlertAction(title: "Yes", style: .default, handler: {(UIAlertAction)in
                        self.initalizeGame()
                    })
                    addalert.addAction(replayAction)
                    
                    let noReplayAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
                    addalert.addAction(noReplayAction)
                    
                    present(addalert, animated: true, completion: nil)
                }else{
                    startRound()
                }
            }
        }
        //user tapped screen during startTimer
        else if currentState! == .startTimer{
            //go to stopTimer state
            currentState = .stopTimer
            stateSwitch(currentState!)
        }
        //end state has no effect. User can only reset through the alert
    }
    
    private func stateSwitch(_ currentState: state){
        switch (currentState){
            case .wait:
                reactionView.backgroundColor = UIColor.red
                mainTextLabel.text = "Wait for Green!"
                feedbackTextLabel.text = ""
                break
            case .startTimer:
                timerInstance.ReactionTimer()
                reactionView.backgroundColor = UIColor.green
                mainTextLabel.text = "Tap!"
                feedbackTextLabel.text = ""
                break
            case .invalidTap:
                reactionView.backgroundColor = UIColor(red: 255/255, green: 236/255, blue: 84/255, alpha: 1.0)
                mainTextLabel.text = "Too Soon!"
                feedbackTextLabel.text = "Tap to retry"
                break
            case .stopTimer:
                timerInstance.ReactionTimer()
                let ms = timerInstance.getMSTime()
                totalMS += ms
                reactionView.backgroundColor = UIColor(red: 118/255, green: 214/255, blue: 255/255, alpha: 1.0)
                mainTextLabel.text = "\(ms) millseconds"
                feedbackTextLabel.text = "Tap to continue"
                break
            case .end:
            reactionView.backgroundColor = UIColor(red: 118/255, green: 214/255, blue: 255/255, alpha: 1.0)
                mainTextLabel.text = "Test Has Ended!"
                feedbackTextLabel.text = ""
                break
        }
    }
}
