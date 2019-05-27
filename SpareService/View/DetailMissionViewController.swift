//
//  DetailMissionViewController.swift
//  SpareService
//
//  Created by Vithursan Sivakumaran on 06/05/2019.
//  Copyright © 2019 oualiken ourdia. All rights reserved.
//

import UIKit

class DetailMissionViewController: UIViewController {

    var subServiceName : String = ""
    var serviceName : String = ""
    var serviceDescription : String = ""
    
    @IBOutlet weak var serviceNameLabel: UILabel!
    @IBOutlet weak var serviceDescriptionTextView: UITextView!
    @IBOutlet weak var lieuInterventionLabel: UILabel!
    @IBOutlet weak var adresseTextField: UITextField!
    @IBOutlet weak var codePostalTextField: UITextField!
    @IBOutlet weak var villeTextField: UITextField!
    class func newInstance(serviceName : String, subServiceName : String, serviceDescription : String) -> DetailMissionViewController {
        let wvc = DetailMissionViewController()
        wvc.serviceName = serviceName
        wvc.subServiceName = subServiceName
        wvc.serviceDescription = serviceDescription
        return wvc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        serviceNameLabel.text = "\(serviceName)\n\(subServiceName)"
        serviceDescriptionTextView.text = serviceDescription
        lieuInterventionLabel.text = "Indiquer le lieu d'intervention"
        serviceDescriptionTextView.isEditable = false
        serviceDescriptionTextView.layer.borderWidth = 1
        serviceDescriptionTextView.layer.borderColor = UIColor.gray.cgColor
        // Do any additional setup after loading the view.
    }

    @IBAction func finaliserBtn(_ sender: UIButton) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
