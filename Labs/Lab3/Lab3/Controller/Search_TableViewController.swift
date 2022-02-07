//
//  Search_TableViewController.swift
//  Lab3
//
//  Created by BenD on 2/6/22.
//

import UIKit

class Search_TableViewController: UITableViewController, UISearchResultsUpdating {
    var allGames = [VideoGameData]()
    var filteredGenres = [String]()

    func updateSearchResults(for searchController: UISearchController) {
        let searchString = searchController.searchBar.text
        filteredGenres.removeAll(keepingCapacity: true)
        if searchString?.isEmpty == false {
            let searchfilter: (String) -> Bool = { name in
                let range = name.range(of: searchString!, options: .caseInsensitive)
                return range != nil
            }
                for item in allGames {
                    let gamesForSearch = item.games
                    let matches = gamesForSearch.filter(searchfilter)
                    filteredGenres.append(contentsOf: matches)
                }
        }
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "videoGameGenreCell")
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredGenres.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoGameGenreCell", for: indexPath)
        var cellConfig = cell.defaultContentConfiguration()
        cellConfig.text = filteredGenres[indexPath.row]
        cell.contentConfiguration = cellConfig
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Row selected", message: "You selected \(filteredGenres[indexPath.row])", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
