//
//  GroceryTableViewController.swift
//  datap-notification-followalong
//
//  Created by BenD on 2/24/22.
//

import UIKit

class GroceryTableViewController: UITableViewController {
    var groceries = [String]()
    var groceryData = GroceryDataHandler()
    let dataFile = "grocery.plist"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func addGrocery(_ sender: UIBarButtonItem) {
        let addalert = UIAlertController(title: "New Item", message: "Add a new item to the list", preferredStyle: .alert)
        //add
        addalert.addTextField(configurationHandler: {(UITextField) in})
        let cancelAction = UIAlertAction(title: "Cacnel", style: .cancel, handler: nil)
        addalert.addAction(cancelAction)
        let addItemAction = UIAlertAction(title: "Add", style: .default, handler:
            {(UIAlertAction) in
            let newItem = addalert.textFields![0] //textfield is an array
            if newItem.text?.isEmpty == false{
                let newGroceryItem = newItem.text!
                self.groceries.append(newGroceryItem)
                self.groceryData.addItem(newItem: newGroceryItem) //add to data handler
                self.tableView.reloadData()
            }
        })
        addalert.addAction(addItemAction)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groceries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var cellConfig = cell.defaultContentConfiguration()
        cellConfig.text = groceries[indexPath.row]
        cell.contentConfiguration = cellConfig
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groceries.remove(at: indexPath.row)
            groceryData.deleteItem(index: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

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
