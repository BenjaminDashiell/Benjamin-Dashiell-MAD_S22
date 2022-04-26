//
//  ViewController.swift
//  Project_HumanBenchmark
//
//  Created by BenD on 2/16/22.
//

import UIKit

class timerClass{
    private var timer: Timer = Timer()
    private var msCount: Double = 0 //will be used for getting the time in ms or secs
    private var count: Int = 0 //will be used for getting the time in ms or secs
    private var timerActive: Bool = false //flag to know if we are currently running timer
    
    //MARK: For Reaction Test
    func ReactionTimer(){
        if(timerActive){
            timerActive=false //set timerActive to false
            timer.invalidate() //stop function
        }else{
            timerActive=true //set timerActive to true
            msCount = 0
            timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(reactionCounter), userInfo: nil, repeats: true)
        }
    }
    @objc func reactionCounter(){
        msCount = msCount+0.001
    }
    func getMSTime()-> Int{
        //print("Time returned is \(msCount), \(msCount*1000)")
        return Int(msCount*1000)
    }
    
    
//    func secsToHrMinSecs(_ seconds: Int) -> (Int, Int, Int){
//        return ((seconds/3600), ((seconds%3600)/60), ((seconds%3600)%60))
//    }
//
//    func makeTimeString(hrs: Int, mins: Int, secs: Int) -> String{
//        var timeString = ""
//        timeString += String(format: "%02d", hrs)+":"
//        timeString += String(format: "%02d", mins)+":"
//        timeString += String(format: "%02d", secs)
//        return timeString
//    }
//
//    //additional
//    @IBAction func startCountdownTest(_ sender: Any){
//        if(timerCounting){
//            //if timer is counting and button was pressed, stop
//            timerCounting=false
//            timer.invalidate() //stop function
//        }else{
//            timerCounting=true
//            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDownCounter), userInfo: nil, repeats: true)
//        }
//    }
//    @objc func countDownCounter(){
//        if(count > 0){
//            count = count-1
//            let time = secsToHrMinSecs(count)
//            //let timeString = makeTimeString(hrs: time.0, mins: time.1, secs: time.2)
//            //timerTestLabel.text = timeString
//        }
//        else{
//            timerCounting=false
//            timer.invalidate() //stop function
//            print("countdown complete")
//        }
//    }
    
    func setCount(secs: Int){
        count = secs
    }
    func returnTimeString(timeString: String) -> String{
        return timeString
    }
    func getSecCount() -> Int{
        return count
    }
}
