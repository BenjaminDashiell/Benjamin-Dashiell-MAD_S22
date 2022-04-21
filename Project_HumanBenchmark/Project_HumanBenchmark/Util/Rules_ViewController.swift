//
//  Rules_ViewController.swift
//  Project_HumanBenchmark
//
//  Created by BenD on 4/14/22.
//

import UIKit

class Rules_ViewController: UIViewController {

    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var gameDesc: UILabel!
    
    var theGameTitle = String()
    var theGameDesc = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        gameTitle.text=theGameTitle
        gameDesc.text=theGameDesc
    }
}
