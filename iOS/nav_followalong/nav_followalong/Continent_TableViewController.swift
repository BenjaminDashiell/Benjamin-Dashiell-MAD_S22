//
//  Continent_TableViewController.swift
//  nav_followalong
//
//  Created by BenD on 2/1/22.
//

import UIKit

class Continent_TableViewController: UITableViewController {

    //continentCell
    var continentList = [String]()
    var continentsData = ContinentsDataLoader()
    let dataFile = "continents2"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continentsData.loadData(filename: dataFile)
        continentList=continentsData.getContinents()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return continentList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "continentCell", for: indexPath)

        // Configure the cell...
        var cellConfig = cell.defaultContentConfiguration()
        cellConfig.text = continentList[indexPath.row]
        cell.contentConfiguration = cellConfig
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "countrySegue" {
            if let countryVC = segue.destination as? CountryTableViewController {
                if let indexPath = tableView.indexPath(for: (sender as? UITableViewCell)!) {
                        //sets the data for the destination controller
                        countryVC.title = continentList[indexPath.row]
                        countryVC.continentsData = continentsData
                        countryVC.selectedContinent = indexPath.row
                }
            }
        }
    }

}
