//
//  VerbalMemory_ViewController.swift
//  Project_HumanBenchmark
//
//  Created by BenD on 3/15/22.
//

import UIKit

class VerbalMemory_ViewController: UIViewController {
    // MARK: Setup (Variables/Outlets)
    var lives = 3
    var score = 0
    var wordBank = [String]()
    var pastWords = [String]()
    var currentWord = ""
    
    var wordData = WordbankDataLoader()
    let filename = "Words"
    
    @IBOutlet weak var livesCounter: UILabel!
    @IBOutlet weak var scoreCounter: UILabel!
    @IBOutlet weak var displayCurrentWord: UILabel!
    @IBOutlet weak var seenButton: UIButton!
    @IBOutlet weak var newButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        livesCounter.text = "Lives | 3"
        lives = 3
        scoreCounter.text = "Score | 0"
        score = 0
        wordData.loadData(filename: filename)
        wordBank = wordData.getWords()
        currentWord = wordBank.randomElement()!
        displayCurrentWord.text = currentWord
        pastWords.removeAll()
    }
    
    // MARK: Running Mini-game
    // if newWord, logicCheck takes in true bool
    @IBAction func isSeenWord(_ sender: UIButton) {
        logicCheck(false)
    }

    // if seenWord, logicCheck takes in false bool
    @IBAction func isNewWord(_ sender: UIButton) {
        logicCheck(true)
    }
    
    private func logicCheck(_ choice: Bool){
        //if user selects new AND the word is new
        if choice && !pastWords.contains(currentWord){
            score += 1
            scoreCounter.text = "Score | " + String(score)
            pastWords.append(currentWord)
        }
        //if user selects seen AND if the word is seen
        else if !choice && pastWords.contains(currentWord){
            score += 1
            scoreCounter.text = "Score | " + String(score)
        }
        //incorrect
        else{
            //check if the player still has lives left
            if lives != 0{
                lives -= 1
                livesCounter.text = "Lives | " + String(lives)
                if !pastWords.contains(currentWord){
                    pastWords.append(currentWord)
                }
            }
            else{
                print("The Game Has Ended. Your score was \(score)")
                seenButton.isEnabled = false
                newButton.isEnabled = false
                //player has no lives and will be sent to score vc
            }
        }
        currentWord = wordBank.randomElement()!
        displayCurrentWord.text = currentWord
    }
}
