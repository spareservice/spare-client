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
    @IBOutlet weak var hourTextView: UITextField!
    @IBOutlet weak var dateTextView: UITextField!
    
    private var datePicker: UIDatePicker?
    private var hourPicker: UIDatePicker?
    var dateChanged = false
    var hourChanged = false
    
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
        
        datePicker = UIDatePicker()
        datePicker?.locale = Locale(identifier: "fr")
        datePicker?.datePickerMode = .date
        dateTextView.inputView = datePicker
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateTextView.text = dateFormatter.string(from: self.datePicker!.date)
        
        hourPicker = UIDatePicker()
        hourPicker?.locale = Locale(identifier: "fr")
        hourPicker?.datePickerMode = .time
        hourTextView.inputView = hourPicker
        dateFormatter.dateFormat = "HH:mm"
        hourTextView.text = dateFormatter.string(from: self.hourPicker!.date)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(DetailAnnonceViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateTextView.text = dateFormatter.string(from: self.datePicker!.date)
        
        dateFormatter.dateFormat = "HH:mm"
        hourTextView.text = dateFormatter.string(from: self.hourPicker!.date)
        view.endEditing(true)
    }
    
    @IBAction func finaliserBtn(_ sender: UIButton) {
        /*
        print("\(adresseTextField.text!), \(codePostalTextField.text!) \(villeTextField.text!)")
        SpareServiceServices.default.addAnnonce(email: email, serviceName: serviceName, subServiceName: subServiceName, serviceDescription: serviceDescription, serviceAdresse: "\(adresseTextField.text!), \(codePostalTextField.text!) \(villeTextField.text!)", debutDate: "\(dateTextView.text!)", debutHeure: "\(hourTextView.text!)", completion: { (res) in
                print(res)
                let alert = UIAlertController(title: "Annonce posté", message: "Votre annonce a été posté au alentour du lieu d'intervention", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                    var services : [String] = []
                    SpareServiceServices.default.getPrincipalServices(completion: {res in
                        res.forEach{ (response) in
                            print(response)
                            services.append(response)
                        }
                        let next = WelcomeViewController.newInstance(email: self.email, services: services)
                        self.navigationController?.pushViewController(next, animated: true)
                    })
                }))
                self.present(alert, animated: true)
            })
    }
    */
        let next = PaimentPaypalController.newInstance()
        self.navigationController?.pushViewController(next, animated: true)
    
        
    }
}
