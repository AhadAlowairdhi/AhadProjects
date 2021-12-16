//
//  UserMadLipsViewController.swift
//  MadLips
//
//  Created by admin on 16/12/2021.
//

import UIKit

class UserMadLipsViewController: UIViewController {

    @IBOutlet weak var adjTF: UITextField!
    @IBOutlet weak var verb1TF: UITextField!
    @IBOutlet weak var verb2TF: UITextField!
    @IBOutlet weak var nounTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func submitBtnAction(_ sender: UIButton) {
        performSegue(withIdentifier: "usermadlips", sender: self)
    }
    
}
