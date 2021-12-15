//
//  ViewController.swift
//  BeastList Ahad
//
//  Created by admin on 15/12/2021.
//
import Foundation
import UIKit

class CustomCell : UITableViewCell {
    var delegate : BeastCellDelegate?
    
    @IBAction func showBtnAction(_ sender: UIButton) {
        delegate?.showTaskDescription(description: (self.textLabel?.text)!)
    }
}

protocol BeastCellDelegate: class {
    func showTaskDescription(description: String)
}


class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate , BeastCellDelegate {
    @IBOutlet weak var tfEnter: UITextField!
    @IBOutlet weak var tableViewBeasts: UITableView!
    @IBOutlet weak var lbDescription: UILabel!
    
    var userInput = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewBeasts.dataSource = self
        tableViewBeasts.delegate = self
    }
    
// protocol func Section
    func showTaskDescription(description: String) {
        lbDescription.text = description
    }

// Adding beast action Section
    @IBAction func btnBeastAction(_ sender: UIButton) {
        addingTheBeast()
        // update TableView
        tableViewBeasts.reloadData()
        //clear TeaxtField
        tfEnter.text = ""
    }
    
    func addingTheBeast() -> Array<String> {
        var inputU = tfEnter.text
        if let inputU = inputU {
            userInput.append(inputU)
        }
        return userInput
    }
    
    
// Table View Section
    
    // counting cell number
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInput.count
    }
    
    // what is data inside cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellBeast = tableViewBeasts.dequeueReusableCell(withIdentifier: "cellBeast", for: indexPath) as! CustomCell
        cellBeast.textLabel?.text = userInput[indexPath.row]
        cellBeast.delegate = self
        return cellBeast
    }
    
    // if user select cell can delete it
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("Section: \(indexPath.section) and Row: \(indexPath.row)")
        userInput.remove(at: indexPath.row)
        //update after delete
        tableView.reloadData()
    }
    
}

