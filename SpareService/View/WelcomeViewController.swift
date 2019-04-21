//
//  WelcomeViewController.swift
//  SpareService
//
//  Created by oualiken ourdia on 21/04/2019.
//  Copyright © 2019 oualiken ourdia. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
 
    

    @IBOutlet var maison: UIButton!
    @IBOutlet var transport: UIView!
    @IBOutlet var aide: UIButton!
    @IBOutlet var reparationDeVihicule: UIButton!
    @IBOutlet var jardin: UIButton!
    @IBOutlet var soinsDucorp: UIButton!
    class func newInstance() -> WelcomeViewController {
        let mlvc = WelcomeViewController()
        return mlvc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jardin.backgroundColor = .clear
        jardin.layer.cornerRadius = 5
        jardin.layer.borderWidth = 1
        jardin.layer.borderColor = UIColor.black.cgColor
        
        
      
        
    }

  


}
