//
//  ViewController.swift
//  Rainbow Ahad
//
//  Created by admin on 15/12/2021.
//

import UIKit


class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate{

    @IBOutlet weak var tbViewRainbow: UITableView!
    
    let rainbowColor = [UIColor.red , UIColor.orange , UIColor.yellow , UIColor.green , UIColor.blue , UIColor.purple ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tbViewRainbow.dataSource = self
        tbViewRainbow.delegate = self
        tbViewRainbow.reloadData()
    }
    

// Table View Section
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rainbowColor.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tbViewRainbow.dequeueReusableCell(withIdentifier: "rainbowCell", for: indexPath)
        cell.backgroundColor = rainbowColor[indexPath.row]
        return cell
    }
    
    //Change the cell's height to 120px.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}

