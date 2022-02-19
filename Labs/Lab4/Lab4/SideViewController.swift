//
//  ViewController.swift
//  Lab4
//
//  Created by BenD on 2/19/22.
//

import UIKit

class SideViewController: UITableViewController {
    var genres = [String]()
    var genreData = DataLoader()
    let dataFile = "genreData"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genreData.loadData(filename: dataFile)
        genres = genreData.getGenres()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genres.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sideViewCell", for: indexPath)
        var cellConfig = cell.defaultContentConfiguration()
        cellConfig.text = genres[indexPath.row]
        cell.contentConfiguration = cellConfig
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let genreURL = genreData.getURL(index: indexPath.row)
                let genreName = genres[indexPath.row]
                let webdetailVC = (segue.destination as! UINavigationController).topViewController as! WebpageViewController
                webdetailVC.webpage = genreURL
                webdetailVC.title = genreName
            }
        }
    }
}

