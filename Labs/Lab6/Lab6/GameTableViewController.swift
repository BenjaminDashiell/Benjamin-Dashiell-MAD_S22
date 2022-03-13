//
//  GameTableViewController.swift
//  Lab6
//
//  Created by BenD on 3/13/22.
//

import UIKit

class GameTableViewController: UITableViewController {
    var games = [String]()
    var gamesData = GameDataHandler()
    let dataFile = "games.plist"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        gamesData.loadData(fileName: dataFile)
        games = gamesData.getGames()
        
        //Notification Setup
        NotificationCenter.default.addObserver(self, selector: #selector(self.applicationWillResignActive(_:)), name: UIApplication.willResignActiveNotification, object: nil)
    }

    @objc func applicationWillResignActive(_ notification: Notification){
        gamesData.saveData(fileName: dataFile)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath)
        var cellConfig = cell.defaultContentConfiguration()
        cellConfig.text = games[indexPath.row]
        cell.contentConfiguration = cellConfig
        return cell
    }

    @IBAction func addGameTitle(_ sender: UIBarButtonItem) {
        let addalert = UIAlertController(title: "New Game Title", message: "Add a new video game title to your checklist", preferredStyle: .alert)
        addalert.addTextField(configurationHandler: {(UITextField) in })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        addalert.addAction(cancelAction)
        let addItemAction = UIAlertAction(title: "Add", style: .default, handler: {(UIAlertAction) in
            let newitem = addalert.textFields![0]
            if newitem.text?.isEmpty == false{
                let newGameTitle = newitem.text!
                self.games.append(newGameTitle)
                self.gamesData.addItem(newItem: newGameTitle)
                self.tableView.reloadData()
            }
        })
        addalert.addAction(addItemAction)
        present(addalert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            games.remove(at: indexPath.row)
            gamesData.deleteItem(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
}
