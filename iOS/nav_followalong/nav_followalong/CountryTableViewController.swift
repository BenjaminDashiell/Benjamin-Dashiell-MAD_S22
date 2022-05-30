//
//  CountryTableViewController.swift
//  nav_followalong
//
//  Created by BenD on 2/3/22.
//

import UIKit

class CountryTableViewController: UITableViewController {

    var continentsData = ContinentsDataLoader()
    var selectedContinent = 0
    var countryList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)

        var cellConfig = cell.defaultContentConfiguration()
        cellConfig.text = countryList[indexPath.row]
        cell.contentConfiguration = cellConfig

        return cell
    }

    override func viewWillAppear(_ animated: Bool) {
        countryList = continentsData.getCountries(index: selectedContinent)
    }
    
    //Must use to support condtional editing of table view
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                //Delete the country from the array
                countryList.remove(at: indexPath.row)
                // Delete the row from the table
                tableView.deleteRows(at: [indexPath], with: .fade)
                //Delete from the data model instance
                continentsData.deleteCountry(index: selectedContinent, countryIndex: indexPath.row)
            }
            else if editingStyle == .insert {
                // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            }
            //NOTE: You get swipe to delete for free when editing is enabled
    }
    
    //Move row code (see pdf)
    
    
}
