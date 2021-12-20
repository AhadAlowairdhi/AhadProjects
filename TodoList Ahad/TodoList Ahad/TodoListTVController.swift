//
//  TodoListTVController.swift
//  TodoList Ahad
//
//  Created by admin on 19/12/2021.
//

import UIKit
import CoreData

class TodoListTVController: UITableViewController {

    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let managedObjectSaveContext = (UIApplication.shared.delegate as! AppDelegate).saveContext
    
    var todoLists = [TodoListItem]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchAllTasks()

    }
// coreData section
    func fetchAllTasks(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "TodoListItem")
        do {
            let result = try managedObjectContext.fetch(request)
            todoLists = result as! [TodoListItem]
        } catch {
            print("\(error)")
        }
    }
    
    
// tableview section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todoLists.count
    }
    // content cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TableViewCell
        
        let task = todoLists[indexPath.row]
        cell.titleOutlet.text = task.titelTask
        cell.descripOutlet.text = task.descriptionTask
        
        // date format
        let dateT = DateFormatter()
        dateT.dateStyle = .short
        dateT.timeStyle = .none
        
        // date String
        
        let dateString = dateT.string(from: task.dateTask!)
        cell.dateOutlet.text = dateString
        
        if task.completed {
            cell.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
        
        return cell
    }
    
    // checkmark cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = todoLists[indexPath.row]
        task.completed = !task.completed
        
        if task.completed {
                    tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
                }else{
                    tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
                }
        managedObjectSaveContext()
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // swipe to delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let task = todoLists[indexPath.row]
        managedObjectContext.delete(task)
        
        managedObjectSaveContext()
        // save after delete and update
        todoLists.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
}
