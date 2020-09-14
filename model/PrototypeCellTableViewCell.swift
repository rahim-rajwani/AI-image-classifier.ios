//
//  PrototypeCellTableViewCell.swift
//  demoAs3_1
//
//  Created by Shubham Soni on 12/6/20.
//  Copyright © 2020 Shubham Soni. All rights reserved.
//

import UIKit

class PrototypeCellTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var objectName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
