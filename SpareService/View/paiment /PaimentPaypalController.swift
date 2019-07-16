//
//  PaimentPaypalController.swift
//  SpareService
//
//  Created by oualiken ourdia on 14/07/2019.
//  Copyright © 2019 oualiken ourdia. All rights reserved.
//

import UIKit

class PaimentPaypalController: UIViewController {
    
    class func newInstance() -> PaimentPaypalController {
        
        let mlvc = PaimentPaypalController()
        return mlvc
    }

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    @IBAction func login(_ sender: Any) {
        UIApplication.shared.open(URL(string: "http://localhost:3000/paiment/buy")! as URL, options: [:], completionHandler: nil)
    }
    
    

}
