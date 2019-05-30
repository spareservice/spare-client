//
//  ProfilCellul.swift
//  SpareService
//
//  Created by oualiken ourdia on 30/05/2019.
//  Copyright © 2019 oualiken ourdia. All rights reserved.
//

import UIKit

class ProfilCellul: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet var name: UILabel!
    
    @IBOutlet var imageProfil: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
