//
//  SignUpViewController.swift
//  SpareService
//
//  Created by oualiken ourdia on 07/04/2019.
//  Copyright © 2019 oualiken ourdia. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet var nomTextField: UITextField!
    @IBOutlet var prenomTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var mdpTextField: UITextField!
    @IBOutlet var telTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    class func newInstance() -> SignUpViewController {
        let mlvc = SignUpViewController()
        return mlvc
    }
    
    @IBAction func inscription(_ sender: UIButton) {
        
        let next = SignInViewController.newInstance()
        if(!nomTextField.text!.isEmpty && !prenomTextField.text!.isEmpty && !emailTextField.text!.isEmpty && !mdpTextField.text!.isEmpty && !telTextField.text!.isEmpty){
            SpareServiceServices.default.addClientDetail(nom: nomTextField.text!, prenom: prenomTextField.text!, email: emailTextField.text!, mdp: mdpTextField.text!, tel: telTextField.text!, completion: { resp in
                
                print(resp)
            })
            self.navigationController?.pushViewController(next, animated: true)
            
        }
    }
  
 
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
        
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
