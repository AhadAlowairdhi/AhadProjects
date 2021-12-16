//
//  DirectionViewController.swift
//  Directions NESW Ahad
//
//  Created by admin on 16/12/2021.
//

import UIKit

class DirectionViewController: UIViewController {
    
    @IBOutlet weak var directionOutput: UIButton!
    
    var output : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        directionOutput.setTitle(output, for: .normal)
    }
    
    @IBAction func btnOutput(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
