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
    
    var returnedScore = 0
    var verbalMemoryScore = 0
    var sequenceMemoryScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Initalize
    
    // MARK: Unwind Segues
}
