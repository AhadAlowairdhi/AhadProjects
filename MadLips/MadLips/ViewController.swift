//
//  ViewController.swift
//  MadLips
//
//  Created by admin on 16/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lb: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwind(_ unwindSegue: UIStoryboardSegue){
        
        if let senderVC = unwindSegue.source as? UserMadLipsViewController {
            
            if let adjtf = senderVC.adjTF.text , let v1txt = senderVC.verb1TF.text , let v2txt = senderVC.verb2TF.text , let nountxt = senderVC.nounTF.text {
                
                lb.text = "We are having a perfectly \(adjtf) time right now. Later we will \(v1txt) and \(v2txt) in the \(nountxt) "
            }
            
        }

    }

}

