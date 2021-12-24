//
//  FilmsCell.swift
//  Star Wars API
//
//  Created by admin on 24/12/2021.
//

import UIKit

class FilmsCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var crawlLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
