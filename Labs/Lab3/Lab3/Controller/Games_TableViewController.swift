//
//  Games_TableViewController.swift
//  Lab3
//
//  Created by BenD on 2/6/22.
//

import UIKit

class Games_TableViewController: UITableViewController {
    var videoGameGenreData = VideoGameDataLoader()
    var selectedGenre = 0
    var gamesList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        gamesList = videoGameGenreData.getGames(index: selectedGenre)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gamesList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath)
        var cellConfig = cell.defaultContentConfiguration()
        cellConfig.text = gamesList[indexPath.row]
        cell.contentConfiguration = cellConfig
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            gamesList.remove(at: indexPath.row)
            // Delete the row from the table
            tableView.deleteRows(at: [indexPath], with: .fade)
            //Delete from the data model instance
            videoGameGenreData.deleteGame(index: selectedGenre, gameIndex: indexPath.row)
        }
//        else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
    }
    
    @IBAction func unwindSegue (_ segue:UIStoryboardSegue){
        if segue.identifier=="doneSegue"{
            if let source = segue.source as? AddGame_ViewController {
                if source.addedGameTitle.isEmpty == false{
                    videoGameGenreData.addGame(index: selectedGenre, newGame: source.addedGameTitle, newIndex: gamesList.count)
                    gamesList.append(source.addedGameTitle)
                    tableView.reloadData()
                }
             }
        }
    }
}
