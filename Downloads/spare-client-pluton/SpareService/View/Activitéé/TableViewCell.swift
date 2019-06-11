//
//  TableViewCell.swift
//  SpareService
//
//  Created by oualiken ourdia on 07/06/2019.
//  Copyright © 2019 oualiken ourdia. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet var mission: UILabel!
    @IBOutlet var type: UILabel!
    

    @IBOutlet var prestatire: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
