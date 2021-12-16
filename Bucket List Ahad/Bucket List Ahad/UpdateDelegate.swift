//
//  UpdateDelegate.swift
//  Bucket List Ahad
//
//  Created by admin on 16/12/2021.
//

import Foundation
import UIKit

protocol UpdateDelegate: class {
    func btnSaveAction(by controller: UpdateTableViewController, with text: String, at indexPath: NSIndexPath?)
    func btnCancelAction(by controller: UpdateTableViewController)
}

