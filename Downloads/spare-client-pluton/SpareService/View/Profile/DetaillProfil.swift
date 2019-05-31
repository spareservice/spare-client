//
//  DetaillProfil.swift
//  SpareService
//
//  Created by oualiken ourdia on 30/05/2019.
//  Copyright © 2019 oualiken ourdia. All rights reserved.
//

import UIKit

class DetaillProfil: UIViewController {

    @IBOutlet var name: UILabel!
    public var profil: Profil!
    
    public class func newInstance(profilInstance: Profil) -> DetaillProfil {
        let detail = DetaillProfil()
        detail.profil = profilInstance
        return detail
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.name.text = self.profil.name

    }


  

}
