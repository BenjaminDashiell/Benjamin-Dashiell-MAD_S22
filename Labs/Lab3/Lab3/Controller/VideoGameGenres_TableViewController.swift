//
//  VideoGameGenres_TableViewController.swift
//  Lab3
//
//  Created by BenD on 2/6/22.
//

import UIKit

class VideoGameGenres_TableViewController: UITableViewController {
    //setup
    var genreList = [String]()
    var videoGameGenreData = VideoGameDataLoader()
    let dataFile = "VideoGameData"
    var searchController = UISearchController()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        videoGameGenreData.loadData(filename: dataFile)
        genreList=videoGameGenreData.getGenres()
        
        //nav
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //search
        let resultsController = Search_TableViewController()
        resultsController.allGames = videoGameGenreData.getAllData()
        searchController = UISearchController(searchResultsController: resultsController)
        //search bar
        searchController.searchBar.placeholder = "Enter a game title"
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView=searchController.searchBar
        searchController.searchResultsUpdater = resultsController
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genreList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoGameGenreCell", for: indexPath)
        var cellConfig = cell.defaultContentConfiguration()
        cellConfig.text = genreList[indexPath.row]
        cell.contentConfiguration = cellConfig
        return cell
    }
    
    //segue handling
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameSegue" {
            if let gamesVC = segue.destination as? Games_TableViewController {
                if let indexPath = tableView.indexPath(for: (sender as? UITableViewCell)!) {
                    //sets the data for the destination controller
                    gamesVC.title = genreList[indexPath.row]
                    gamesVC.videoGameGenreData = videoGameGenreData
                    gamesVC.selectedGenre = indexPath.row
                }
            }
        }
        else if segue.identifier == "infoSegue"{
            if let genreinfoVC = segue.destination as? GenreInfo_TableViewController {
                if let editingCell = sender as? UITableViewCell {
                    let indexPath = tableView.indexPath(for: editingCell)
                    genreinfoVC.genreName = genreList[indexPath!.row]
                    let gameList = videoGameGenreData.getGames(index: (indexPath?.row)!)
                    genreinfoVC.numGames = String(gameList.count)
                }
            }
        }
    }
}
