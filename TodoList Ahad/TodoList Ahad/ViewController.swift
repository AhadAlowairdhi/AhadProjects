//
//  ViewController.swift
//  TodoList Ahad
//
//  Created by admin on 19/12/2021.
//

import UIKit

class ViewController: UIViewController {
// Outlet connection
    @IBOutlet weak var tfOutlet: UITextField!
    @IBOutlet weak var tvOutlet: UITextView!
    @IBOutlet weak var pickerDateOutlet: UIDatePicker!
    
// manage DataModel
    
    let managedObjectContetext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let managedObjectSaveContetext = (UIApplication.shared.delegate as! AppDelegate).saveContext
       
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
//button acction section & coreData section
    @IBAction func AddItemAction(_ sender: UIButton) {
        
        if tfOutlet.text == "" || tvOutlet.text == "" {
            dismiss(animated: true, completion: nil)
        }else {
            let task = TodoListItem(context: managedObjectContetext)
            task.titelTask = tfOutlet.text
            task.descriptionTask = tvOutlet.text
            task.dateTask = pickerDateOutlet.date
            
            // save context
            managedObjectSaveContetext()
            dismiss(animated: true, completion: nil)
        }
    }
    
    
}
