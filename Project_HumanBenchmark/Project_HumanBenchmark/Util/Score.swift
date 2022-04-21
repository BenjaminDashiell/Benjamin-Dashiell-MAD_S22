//
//  Score.swift
//  Project_HumanBenchmark
//
//  Created by BenD on 4/10/22.
//

import Foundation

class Score{
    static let scoreInstance = Score()
    private init(){}
    
//    private var verbalScore = 10
//    private var sequenceScore = 4
//    private var numberScore = 1
//    private var reactionScore = 250
    
    private var verbalScore = 0
    private var sequenceScore = 0
    private var numberScore = 0
    private var reactionScore = 10000
    private var username = "Ben"
    
    func getVerbalScore() -> Int{
        return verbalScore
    }
    func getSequenceScore() -> Int{
        return sequenceScore
    }
    func getNumberScore() -> Int{
        return numberScore
    }
    func getReactionScore() -> Int{
        return reactionScore
    }
    func getUsername() -> String{
        return username
    }
    
    func setVerbalScore(_ input: Int){
        if input > verbalScore{
            verbalScore = input
        }
    }
    func setSequenceScore(_ input: Int){
        if input > sequenceScore{
            sequenceScore = input
        }
    }
    func setNumberScore(_ input: Int){
        if input > numberScore{
            numberScore = input
        }
    }
    func setReactionScore(_ input: Int){
        //we'd actually want better average reaction times (less than the current)
        if input < reactionScore{
            reactionScore = input
        }
    }
}
