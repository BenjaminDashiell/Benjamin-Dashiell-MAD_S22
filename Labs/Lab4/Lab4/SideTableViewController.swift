//
//  SideTableViewController.swift
//  Lab4
//
//  Created by BenD on 2/20/22.
//

import UIKit

class SideTableViewController: UITableViewController {
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
            //print("prepare segue was called")
            if let indexPath = self.tableView.indexPathForSelectedRow {
                //print("inside let statement of segue")
                let genreURL = genreData.getURL(index: indexPath.row)
                let genreName = genres[indexPath.row]
                let webdetailVC = (segue.destination as! UINavigationController).topViewController as! WebpageViewController
                //print("genreURL: ",genreURL)
                //print("genreName: ",genreName)
                //print("webdetailVC: ",webdetailVC)
                webdetailVC.webpage = genreURL
                webdetailVC.title = genreName
            }
        }
    }
}
