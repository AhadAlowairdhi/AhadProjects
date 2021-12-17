//
//  TableViewController.swift
//  Bucket List Ahad
//
//  Created by admin on 16/12/2021.
//

import CoreData
import UIKit


class TableViewController: UITableViewController , UpdateDelegate {
  
    var bucketListItem = [BucketListItem]()
    // DB object
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllItems()
    }

// CoreData section
    func fetchAllItems() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "BucketListItem")
        do {
            let result = try managedObjectContext.fetch(request)
            bucketListItem = result as! [BucketListItem]
        } catch {
            print("\(error)")
        }
    }
    
    
// table view section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bucketListItem.count
    }
     //cell content
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellbucket", for: indexPath)
        cell.textLabel?.text = bucketListItem[indexPath.row].text!
    
        return cell
    }
        
    // accessory
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "editSegue", sender: indexPath)
    }
    // swipe to delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let item = bucketListItem[indexPath.row]
                managedObjectContext.delete(item)
                
                do {
                    try managedObjectContext.save()
                } catch {
                    print("\(error)")
                }

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
          } else if sender is IndexPath {
                let navigationController = segue.destination as! UINavigationController
                let addItemTableController = navigationController.topViewController as! UpdateTableViewController
                addItemTableController.delegate = self
            
                let indexPath = sender as! IndexPath
                let item = bucketListItem[indexPath.row]
            
                addItemTableController.itemOutput = item.text!
                addItemTableController.indexPath = indexPath
        }
         
          // bucket list crUD
            /*if segue.identifier == "addSegue"{
              let navigationController = segue.destination as! UINavigationController
              let addItemTableController = navigationController.topViewController as! UpdateTableViewController
              addItemTableController.delegate = self
          } else if segue.identifier == "editSegue" {
               let navigationController = segue.destination as! UINavigationController
               let addItemTableController = navigationController.topViewController as! UpdateTableViewController
              addItemTableController.delegate = self

              let indexPath = sender as! NSIndexPath
              let item = bucketListItem[indexPath.row]

              addItemTableController.itemOutput = item.text!
              addItemTableController.indexPath = indexPath
         }*/
    }

// delegate section
    //save action
    func btnSaveAction(by controller: UpdateTableViewController, with text: String, at indexPath:IndexPath?) {
        // edit
        if let ip = indexPath {
           let item = bucketListItem[ip.row]
            item.text = text
        }else{
            let item = NSEntityDescription.insertNewObject(forEntityName: "BucketListItem", into: managedObjectContext) as! BucketListItem
            item.text = text
            bucketListItem.append(item)
        }
        do {
            try managedObjectContext.save()
            
        } catch {
            print("\(error)")
        }
        
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    //cancel action
    func btnCancelAction(by controller: UpdateTableViewController) {
        dismiss(animated: true, completion: nil)
    }
    
}
