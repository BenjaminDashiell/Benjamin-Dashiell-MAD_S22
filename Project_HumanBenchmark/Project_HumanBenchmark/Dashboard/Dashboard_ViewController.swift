//
//  Dashboard_ViewController.swift
//  Project_HumanBenchmark
//
//  Created by BenD on 3/15/22.
//

import UIKit

class Dashboard_ViewController: UIViewController {
    // MARK: Setup (Variables/Outlets)
    @IBOutlet weak var verbalMemoryScoreLabel: UILabel!
    @IBOutlet weak var sequenceMemoryScoreLabel: UILabel!
    @IBOutlet weak var reactionScoreLabel: UILabel!
    @IBOutlet weak var numberMemoryScoreLabel: UILabel!
    @IBOutlet weak var welcomeText: UILabel!
    
    @IBOutlet weak var verbalMemoryStack: UIStackView!
    @IBOutlet weak var sequenceMemoryScoreStack: UIStackView!
    @IBOutlet weak var reactionScoreStack: UIStackView!
    @IBOutlet weak var numberMemoryScoreStack: UIStackView!

    let accessScores = Score.scoreInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //borders
        verbalMemoryStack.layer.borderColor = UIColor.gray.cgColor
        verbalMemoryStack.layer.borderWidth = 1
        sequenceMemoryScoreStack.layer.borderColor = UIColor.gray.cgColor
        sequenceMemoryScoreStack.layer.borderWidth = 1
        reactionScoreStack.layer.borderColor = UIColor.gray.cgColor
        reactionScoreStack.layer.borderWidth = 1
        numberMemoryScoreStack.layer.borderColor = UIColor.gray.cgColor
        numberMemoryScoreStack.layer.borderWidth = 1
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //Update textfields (has to be viewDidAppear so update with navigating back to dashboard)
        welcomeText.text = "Hello,  \(accessScores.getUsername())"
        verbalMemoryScoreLabel.text = "Score: \(String(accessScores.getVerbalScore()))"
        sequenceMemoryScoreLabel.text = "Score: \(String(accessScores.getSequenceScore()))"
        reactionScoreLabel.text = "Score: \(String(accessScores.getReactionScore()))"
        numberMemoryScoreLabel.text = "Score: \(String(accessScores.getNumberScore()))"
    }
        
    // MARK: Prepare Rule Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "verbalRules" {
                if let rulesVC = segue.destination as? Rules_ViewController {
                    rulesVC.theGameTitle = "Verbal Memory Test"
                    rulesVC.theGameDesc = "You will be shown words, one at a time. If you've seen a word during the test, click SEEN. If it's a new word, click NEW. You have 3 lives before the minigame ends."
                }
            }
            else if segue.identifier == "sequenceRules" {
                if let rulesVC = segue.destination as? Rules_ViewController {
                    rulesVC.theGameTitle = "Sequence Memory Test"
                    rulesVC.theGameDesc = "Your task is to memorize the pattern shown on screen and then tap the squares to match the pattern. Once you fail, the minigame ends. The level number is your final score"
                }
            }
            else if segue.identifier == "reactionRules" {
                if let rulesVC = segue.destination as? Rules_ViewController {
                    rulesVC.theGameTitle = "Reaction Time Test"
                    rulesVC.theGameDesc = "When the red box turns green, tap as quickly as you can. This will be repeated five times and calculate your average score."
                }
            }
            else if segue.identifier == "numberRules" {
                if let rulesVC = segue.destination as? Rules_ViewController {
                    rulesVC.theGameTitle = "Verbal Memory Test"
                    rulesVC.theGameDesc = "You will shown a series of random numbers, one at a time. Each round will add another digit."
                }
            }
    }
}
