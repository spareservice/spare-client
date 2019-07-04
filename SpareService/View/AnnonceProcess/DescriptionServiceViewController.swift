//
//  DescriptionServiceViewController.swift
//  SpareService
//
//  Created by Vithursan Sivakumaran on 06/05/2019.
//  Copyright © 2019 oualiken ourdia. All rights reserved.
//

import UIKit

class DescriptionServiceViewController: UIViewController {

    var email : String = ""
    var subServiceName : String = ""
    var serviceName : String = ""
    
    @IBOutlet weak var serviceNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    class func newInstance(email: String, serviceName : String, subServiceName : String) -> DescriptionServiceViewController {
        let wvc = DescriptionServiceViewController()
        wvc.serviceName = serviceName
        wvc.subServiceName = subServiceName
        wvc.email = email
        return wvc
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        serviceNameLabel.text = "\(serviceName)\n\(subServiceName)"
        descriptionLabel.text = "Quels sont vos besoins ?"
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.borderColor = UIColor.gray.cgColor
        // Do any additional setup after loading the view.
    }

    @IBAction func confirmBtn(_ sender: UIButton) {
        print(descriptionTextView.text!)
        let next = DetailAnnonceViewController.newInstance(email : email, serviceName: serviceName, subServiceName: subServiceName, serviceDescription: descriptionTextView.text!)
        self.navigationController?.pushViewController(next, animated: true)
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
