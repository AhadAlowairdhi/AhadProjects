//
//  ViewController.swift
//  Binary Counter Ahad
//
//  Created by admin on 15/12/2021.
//
import Foundation
import UIKit

class binaryTableViewCell : UITableViewCell {
    
    @IBOutlet weak var lbBinary: UILabel!
    
    var delegate : binaryTableViewCellDelegate?
  
    // binary counter action
    @IBAction func changeBtnAction(_ sender: UIButton) {
        var valueBinary = Int(lbBinary!.text!)
        
        if sender.tag == 1 {
            valueBinary = -valueBinary!
        }
        delegate?.changevalue(binaryValue: valueBinary!)
    }
}

// protocol
protocol binaryTableViewCellDelegate : class {
    func changevalue(binaryValue: Int)
}

class ViewController: UIViewController, UITableViewDataSource , binaryTableViewCellDelegate{
 
    @IBOutlet weak var tbViewBinary: UITableView!
    @IBOutlet weak var lbTotal: UILabel!
    
    var binaryArray = [String]()
    var total = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbViewBinary.dataSource = self
        tbViewBinary.reloadData()
        // Do any additional setup after loading the view.
    }

//Tabl View section
    
    // num of row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 16
    }
    
    //cel content
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellBinary = tbViewBinary.dequeueReusableCell(withIdentifier: "binarycell", for: indexPath) as! binaryTableViewCell
        cellBinary.delegate = self
        cellBinary.lbBinary.text = "\(pow(10, indexPath.row))"
        return cellBinary
    }

// Delegate section
    func changevalue(binaryValue: Int) {
        total += binaryValue
        lbTotal.text = "Total : \(total)"
    }
    
}

