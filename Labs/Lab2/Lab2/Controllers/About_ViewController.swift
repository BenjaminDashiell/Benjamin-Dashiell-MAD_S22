//
//  About_ViewController.swift
//  Lab2
//
//  Created by BenD on 1/30/22.
//

import UIKit

class About_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func openGithub(_ sender: UIButton){
        //App is available
        if(UIApplication.shared.canOpenURL(URL(string: "github://")!)){
        UIApplication.shared.open(URL(string: "github://")!, options: [:], completionHandler: nil)
        }
        else{
            //App is not available
            UIApplication.shared.open(URL(string:
            "https://github.com/BenjaminDashiell/Benjamin-Dashiell-MAD_S22")!, options: [:], completionHandler: nil)
        }
    }
}
