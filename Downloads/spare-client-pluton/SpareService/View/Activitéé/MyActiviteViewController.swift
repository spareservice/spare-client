//
//  MyActiviteViewController.swift
//  SpareService
//
//  Created by oualiken ourdia on 29/05/2019.
//  Copyright © 2019 oualiken ourdia. All rights reserved.
//

import UIKit

class MyActiviteViewController: UIViewController {


    @IBOutlet var segmenControl: UISegmentedControl!
    @IBOutlet var textLabel: UILabel!
    @IBAction func indexChange(_ sender: Any) {
        
        switch segmenControl.selectedSegmentIndex
        {
        case 0:
            textLabel.text = "Vos demandeet et celles ou vous avez postulé apparaitront ici "
        case 1:
            textLabel.text = "une fois que votre résérvation éffectué votre demande apparaitra ici"
        default:
            break
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

  
    }


  

}
