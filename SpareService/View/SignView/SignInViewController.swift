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
    public var missions : [Mission] = []
    public var annonceFirst : Annonce = Annonce()
    
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


    @IBAction func connect(_ sender: UIButton) {
        if(!emailTextField.text!.isEmpty && !mdpTextField.text!.isEmpty){
            sender.isUserInteractionEnabled = false;
            var count = 0
            SpareServiceServices.default.getClientDetail(email: emailTextField.text!, mdp: mdpTextField.text!, completion: { res1 in
                sender.isUserInteractionEnabled = true;
                if(res1.count != 0) {
                    guard let id = res1[0]["_id"] as? String else {return}
                    SpareServiceServices.default.getMissionClient(id: id, completion: { (res3) in
                        if(res3.count != 0) {
                            res3.forEach{ (mission) in
                                guard let idMission = mission["_id"] as? String,
                                    let idClient = mission["_idClient"] as? String,
                                    let idPrestataire = mission["_idPrestataire"] as? String,
                                    let idAnnonce = mission["_idAnnonce"] as? String,
                                    let debutDate = mission["debutDate"] as? String,
                                    let debutHeure = mission["debutHeure"] as? String,
                                    let infoPrestataire = mission["infoPrestataire"] as? String,
                                    let isValide = mission["isValide"] as? String,
                                    let inProcess = mission["inProcess"] as? String else {return}
                                
                                SpareServiceServices.default.getAnnonceById(idAnnonce: idAnnonce, completion: { (annonce) in
                                    guard let idAnnonce = annonce[0]["_id"] as? String,
                                        let idService = annonce[0]["idService"] as? String,
                                        let descriptionAnnonce = annonce[0]["descriptionAnnonce"] as? String,
                                        let detailAnnonce = annonce[0]["detailAnnonce"] as? String else {return}
                                    self.annonceFirst = Annonce(idAnnonce: idAnnonce, idClient: idClient, idService: idService, descriptionAnnonce: descriptionAnnonce, detailAnnonce: detailAnnonce)
                                    
                                    self.missions.append(Mission(idMission: idMission, idClient: idClient, idPrestataire: idPrestataire, idAnnonce: idAnnonce, debutDate: debutDate, debutHeure: debutHeure, infoPrestataire: infoPrestataire, isValide: isValide, inProcess: inProcess, annonce: self.annonceFirst))
                                    
                                    SpareServiceServices.default.getPrincipalServices(completion: {res2 in
                                        while(self.services.count != res2.count){
                                            res2.forEach{ (response) in
                                                print(response)
                                                self.services.append(response)
                                            }
                                        }
                                        count += 1
                                        if (self.missions.count == res3.count && count == res3.count) {
                                            let next = SpareTabBarController.newInstance(email: self.emailTextField.text!, services: self.services, missions: self.missions)
                                            self.navigationController?.pushViewController(next, animated: true)
                                        } 
                                    })
                                })
                            }
                        }
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
