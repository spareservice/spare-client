//
//  DetailAnnonceViewController.swift
//  SpareService
//
//  Created by Vithursan Sivakumaran on 08/05/2019.
//  Copyright © 2019 oualiken ourdia. All rights reserved.
//

import UIKit

class DetailAnnonceViewController: UIViewController {

    var email : String = ""
    var subServiceName : String = ""
    var serviceName : String = ""
    var serviceDescription : String = ""
    
    @IBOutlet weak var serviceNameLabel: UILabel!
    @IBOutlet weak var serviceDescriptionTextView: UITextView!
    @IBOutlet weak var lieuInterventionLabel: UILabel!
    @IBOutlet weak var adresseTextField: UITextField!
    @IBOutlet weak var codePostalTextField: UITextField!
    @IBOutlet weak var villeTextField: UITextField!
    class func newInstance(email: String, serviceName : String, subServiceName : String, serviceDescription : String) -> DetailAnnonceViewController {
        let wvc = DetailAnnonceViewController()
        wvc.email = email
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
        print(email)
        print(serviceName)
        print(subServiceName)
        print(serviceDescription)
        print("\(adresseTextField.text!), \(codePostalTextField.text!) \(villeTextField.text!)")
        SpareServiceServices.default.addAnnonce(email: email, serviceName: serviceName, subServiceName: subServiceName, serviceDescription: serviceDescription, serviceAdresse: "\(adresseTextField.text!), \(codePostalTextField.text!) \(villeTextField.text!)", completion: { (res) in
                print(res)
            })
        //self.navigationController?.pushViewController(next, animated: true)
       
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
