//
//  ViewController.swift
//  AgingPeople Ahad
//
//  Created by admin on 15/12/2021.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource {

    @IBOutlet weak var tbViewPeople: UITableView!
    
    let names = ["Maha", "Ahad", "Lama", "Saad", "Nawaf","Nasser", "Feras", "Noura", "Wjdan", "Nada", "Amaal", "Ramia"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbViewPeople.dataSource = self
        tbViewPeople.reloadData()
        // Do any additional setup after loading the view.
    }

    
    
//Table View Section
    
    // counter of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    // cell content
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellNames = tbViewPeople.dequeueReusableCell(withIdentifier: "cellNames", for: indexPath)
        cellNames.textLabel?.text = names[indexPath.row]
        for i in names.indices {
            let age = Int.random(in: 5...95)
            cellNames.detailTextLabel?.text = "\(age)"
        }
        return cellNames
    }

    
}

