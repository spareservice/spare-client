//
//  MissionTableViewCell.swift
//  SpareService
//
//  Created by Vithursan Sivakumaran on 25/06/2019.
//  Copyright © 2019 oualiken ourdia. All rights reserved.
//

import UIKit

class MissionTableViewCell: UITableViewCell {

    @IBOutlet weak var detailAnnonce: UILabel!
    @IBOutlet weak var descriptionAnnonce: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
