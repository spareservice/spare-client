//
//  SignUpViewController.swift
//  SpareService
//
//  Created by oualiken ourdia on 07/04/2019.
//  Copyright © 2019 oualiken ourdia. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet var titreLabel: UILabel!
    @IBOutlet var nomTextField: UITextField!
    @IBOutlet var prenomTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var mdpTextField: UITextField!
    @IBOutlet var telTextField: UITextField!
    @IBOutlet var erreurInscriptionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //erreurInscriptionLabel.isHidden = true
    }
    
    class func newInstance() -> SignUpViewController {
        let mlvc = SignUpViewController()
        return mlvc
    }
    
    @IBAction func inscription(_ sender: UIButton) {
        
        let next = SignInViewController.newInstance()
        if(!nomTextField.text!.isEmpty && !prenomTextField.text!.isEmpty && !emailTextField.text!.isEmpty && !mdpTextField.text!.isEmpty && !telTextField.text!.isEmpty){
            SpareServiceServices.default.checkClient(email: self.emailTextField.text!, completion: { res1 in
                if(res1.count != 0){
                    self.titreLabel.text = "Utilisateur déjà existant"
                    self.titreLabel.textColor = UIColor.red
                    self.titreLabel.isHidden = false
                } else {
                    SpareServiceServices.default.addClientDetail(nom: self.nomTextField.text!, prenom: self.prenomTextField.text!, email: self.emailTextField.text!, mdp: self.mdpTextField.text!, tel: self.telTextField.text!, completion: { resp in
                        guard let email = resp[0]["email"] as? String else {return}
                        
                    })
                    self.navigationController?.pushViewController(next, animated: true)
                }
            })
        } else {
            self.titreLabel.text = "Veuillez remplir les champs ci-dessus"
            self.titreLabel.textColor = UIColor.red
            self.titreLabel.isHidden = false
        }
    }
  
 
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false , animated: animated)
        
        
        
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
