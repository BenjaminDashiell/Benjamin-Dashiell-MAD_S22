//
//  AddGame_ViewController.swift
//  Lab3
//
//  Created by BenD on 2/6/22.
//

import UIKit

class AddGame_ViewController: UIViewController {
    var addedGameTitle = String()
    @IBOutlet weak var gameTitleTextfield: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneSegue"{
            if gameTitleTextfield.text?.isEmpty == false{
                addedGameTitle=gameTitleTextfield.text!
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
