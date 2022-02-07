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
    var searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        data.loadData(filename: wordFile)
        words=data.getWords()
        
        //search results
        let resultsController = SearchResults_TVC() //create an instance of our SearchResultsController class
        resultsController.allWords = words //set the allwords property to our words array
        searchController = UISearchController(searchResultsController: resultsController)
        //initialize our search controller with the resultsController when it has search results to display
        
        //search bar configuration
        searchController.searchBar.placeholder = "Enter a search term" //place holder text
        searchController.searchBar.sizeToFit() //sets appropriate size for the search bar
        tableView.tableHeaderView=searchController.searchBar //install the search bar as the table header
        searchController.searchResultsUpdater = resultsController //sets the instance to update search results
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
