//
//  ViewController.swift
//  Project_HumanBenchmark
//
//  Created by BenD on 2/16/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerTestLabel: UILabel!
    var timer: Timer = Timer()
    var count: Int = 10
    var timerCounting: Bool = false //flag to know if we are currently running timer
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startBGTest(_ sender: Any){
        if(timerCounting){
            //if timer is counting and button was pressed, stop
            timerCounting=false
            timer.invalidate() //stop function
        }else{
            timerCounting=true
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
    }
    @objc func timerCounter(){
        count = count+1
        let time = secsToHrMinSecs(count)
        let timeString = makeTimeString(hrs: time.0, mins: time.1, secs: time.2)
        timerTestLabel.text = timeString
    }
    
    func secsToHrMinSecs(_ seconds: Int) -> (Int, Int, Int){
        return ((seconds/3600), ((seconds%3600)/60), ((seconds%3600)%60))
    }
    
    func makeTimeString(hrs: Int, mins: Int, secs: Int) -> String{
        var timeString = ""
        timeString += String(format: "%02d", hrs)+":"
        timeString += String(format: "%02d", mins)+":"
        timeString += String(format: "%02d", secs)
        return timeString
    }
    
    //additional
    @IBAction func startCountdownTest(_ sender: Any){
        if(timerCounting){
            //if timer is counting and button was pressed, stop
            timerCounting=false
            timer.invalidate() //stop function
        }else{
            timerCounting=true
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDownCounter), userInfo: nil, repeats: true)
        }
    }
    @objc func countDownCounter(){
        if(count > 0){
            count = count-1
            let time = secsToHrMinSecs(count)
            let timeString = makeTimeString(hrs: time.0, mins: time.1, secs: time.2)
            timerTestLabel.text = timeString
        }
        else{
            timerCounting=false
            timer.invalidate() //stop function
            print("countdown complete")
        }
    }
    
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
