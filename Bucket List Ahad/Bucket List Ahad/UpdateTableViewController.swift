//
//  UpdateTableViewController.swift
//  Bucket List Ahad
//
//  Created by admin on 16/12/2021.
//

import UIKit

class UpdateTableViewController: UITableViewController {

    @IBOutlet weak var updateTF: UITextField!
    
    //protpcpl
    weak var delegate : UpdateDelegate?
    
    // note holder
    var itemOutput : String?
    
    var indexPath : NSIndexPath?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTF.text = itemOutput

    }


// item bar action
    @IBAction func saveAction(_ sender: UIBarButtonItem) {
        let text = updateTF.text!
        delegate?.btnSaveAction(by: self, with: text, at: indexPath)
    }
    
    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        delegate?.btnCancelAction(by: self)
    }
    

}
