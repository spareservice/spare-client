//
//  SignInViewController.swift
//  SpareService
//
//  Created by oualiken ourdia on 10/04/2019.
//  Copyright © 2019 oualiken ourdia. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    public var services : [String] = []
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var mdpTextField: UITextField!
    @IBOutlet var erreurLabel: UILabel!
    class func newInstance() -> SignInViewController {
        
        let mlvc = SignInViewController()
        return mlvc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.erreurLabel.isHidden = true
        
        // Do any additional setup after loading the view.
    }


    @IBAction func connect(_ sender: Any) {
        
        
        if(!emailTextField.text!.isEmpty && !mdpTextField.text!.isEmpty){
            SpareServiceServices.default.getClientDetail(email: emailTextField.text!, mdp: mdpTextField.text!, completion: { resp in
                if(resp.count != 0) {
                    guard let nom = resp[0]["nom"] as? String,
                        let prenom = resp[0]["prenom"] as? String else {return}
                    SpareServiceServices.default.getPrincipalServices(completion: {res in
                        res.forEach{ (response) in
                            self.services.append(response)
                        }
                        let next = WelcomeViewController.newInstance(services: self.services)
                        self.navigationController?.pushViewController(next, animated: true)
                    })
                    
                } else {
                    self.erreurLabel.text = "Identifiant et/ou Mot de passe non reconnus"
                    self.erreurLabel.textColor = UIColor.red
                    self.erreurLabel.isHidden = false
                }
            })
        } else {
            self.erreurLabel.text = "Veuillez saisir dans les champs ci-dessus"
            self.erreurLabel.textColor = UIColor.red
            self.erreurLabel.isHidden = false
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        
        
    }

   
}
