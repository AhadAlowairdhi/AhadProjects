//
//  ViewController.swift
//  Directions NESW Ahad
//
//  Created by admin on 16/12/2021.
//

import UIKit

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DirectionViewController
        let button = sender as! UIButton
        if let buttonTitle = button.titleLabel!.text {
                destination.output = buttonTitle
            }
    }

    
}

