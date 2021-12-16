//
//  TableViewController.swift
//  Bucket List Ahad
//
//  Created by admin on 16/12/2021.
//


import UIKit

class TableViewController: UITableViewController , UpdateDelegate {
  
    var bucketListItem = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

// table view section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bucketListItem.count
    }
     //cell content
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellbucket", for: indexPath)
        cell.textLabel?.text = bucketListItem[indexPath.row]
    
        return cell
    }
        
    // accessory
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "editSegue", sender: indexPath)
    }
    // swipe to delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // remove the item at indexPath
        bucketListItem.remove(at: indexPath.row)
        // reload the table view
        tableView.reloadData()
    }
                        
// segue section
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // bucket list refactor
          if sender is UIBarButtonItem{
                let navigationController = segue.destination as! UINavigationController
                let addItemTableController = navigationController.topViewController as! UpdateTableViewController
                addItemTableController.delegate = self
          } else if sender is NSIndexPath {
                let navigationController = segue.destination as! UINavigationController
                let addItemTableController = navigationController.topViewController as! UpdateTableViewController
                addItemTableController.delegate = self
            
                let indexPath = sender as! NSIndexPath
                let item = bucketListItem[indexPath.row]
            
                addItemTableController.itemOutput = item
                addItemTableController.indexPath = indexPath
        }
         
          // bucket list crUD
           /* if segue.identifier == "addSegue"{
              let navigationController = segue.destination as! UINavigationController
              let addItemTableController = navigationController.topViewController as! UpdateTableViewController
              addItemTableController.delegate = self
          } else if segue.identifier == "editSegue" {
               let navigationController = segue.destination as! UINavigationController
               let addItemTableController = navigationController.topViewController as! UpdateTableViewController
              addItemTableController.delegate = self

              let indexPath = sender as! NSIndexPath
              let item = bucketListItem[indexPath.row]

              addItemTableController.itemOutput = item
              addItemTableController.indexPath = indexPath
         }*/
    }

// delegate section
    func btnSaveAction(by controller: UpdateTableViewController, with text: String, at indexPath: NSIndexPath?) {
        // edit
        if let indexPath = indexPath {
            bucketListItem[indexPath.row] = text
        }else{
            bucketListItem.append(text)
        }
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    func btnCancelAction(by controller: UpdateTableViewController) {
        dismiss(animated: true, completion: nil)
    }
    
}
