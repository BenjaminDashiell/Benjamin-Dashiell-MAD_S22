//
//  ViewController.swift
//  scrabbleQ_followAlong
//
//  Created by BenD on 1/27/22.
//

import UIKit

class ViewController: UITableViewController {
    //scrabbleCell is our cell identifier
    
    var words = [String]()
    var data = QDataLoader()
    let wordFile = "qwordswithoutu1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        data.loadData(filename: wordFile)
        words=data.getWords()
    }

    //funcs needed for tableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //get instance of a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "scrabbleCell", for: indexPath)

        //configure
        var cellConfig = cell.defaultContentConfiguration()

        //add stuff
        cellConfig.text = words[indexPath.row]
        //cellConfig.image = UIImage(named:"scrabble_q30")
        //cellConfig.secondaryText = "Q no U"

        //configure
        cell.contentConfiguration = cellConfig
        //tableView.rowHeight = 44.0 //44 is default
        return cell
    }
}
