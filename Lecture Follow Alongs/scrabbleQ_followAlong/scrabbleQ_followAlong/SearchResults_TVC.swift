//
//  SearchResults_TVC.swift
//  scrabbleQ_followAlong
//
//  Created by BenD on 1/27/22.
//

import UIKit

class SearchResults_TVC: UITableViewController, UISearchResultsUpdating {
    var allWords = [String]()
    var filteredWords = [String]()

    //required by UISearchResultsUpdating
    func updateSearchResults(for searchController: UISearchController) {
        let searchString = searchController.searchBar.text //define we want to search by string
        filteredWords.removeAll(keepingCapacity: true) //remove all elements, in case did a search prior
        if searchString?.isEmpty == false{
            //closure that returns true if the search string is present in a String
            let searchFilter: (String)->Bool{ name in
                //lock for the search string as a substrign of the word
                let range = name.range(of: searchString!, options: .caseInsensitive)
                return range != nil //returns true if the value matcehs and false if there's no match
            }
            //filter returns an array with the words that match the search String
            let matches = allWords.filter(searchFilter)
            filteredWords.append(contentsOf: matches)
        }
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //we can always access UITableViewCell from UITableViewController
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "scrabbleCell")
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
