//
//  ViewController.swift
//  Cold Call Ahad
//
//  Created by admin on 05/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var callLabel: UILabel!
    @IBOutlet weak var CallBtn: UIButton!
    @IBOutlet weak var numberLabel: UILabel!
    
    let namesArray = ["Ahad" , "Noura" , "Wjdan" , "Amaal" , "Ramia"]

    
    
    @IBAction func callBtn(_ sender: UIButton) {
       
        for _ in namesArray.indices{
            let randomNum = Int.random(in: 1...5)
            callLabel.text = namesArray.randomElement()
            numberLabel.text = String(randomNum)
            switch randomNum {
                    case 1...2:
                        numberLabel.textColor = UIColor.systemRed
                    case 3...4:
                        numberLabel.textColor = UIColor.systemOrange
                    default:
                        numberLabel.textColor = UIColor.systemGreen
                    }
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

