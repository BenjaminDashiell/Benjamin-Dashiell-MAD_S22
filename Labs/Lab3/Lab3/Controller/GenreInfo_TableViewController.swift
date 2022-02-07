//
//  GenreInfo_TableViewController.swift
//  Lab3
//
//  Created by BenD on 2/6/22.
//

import UIKit

class GenreInfo_TableViewController: UITableViewController {

    @IBOutlet weak var genreTitle: UILabel!
    @IBOutlet weak var genreGameCount: UILabel!
    
    var genreName = String()
    var numGames = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        genreTitle.text=genreName
        genreGameCount.text=numGames
    }
}
