//
//  PrestataireViewController.swift
//  SpareService
//
//  Created by Vithursan Sivakumaran on 12/06/2019.
//  Copyright © 2019 oualiken ourdia. All rights reserved.
//

import UIKit

class PrestataireViewController: UIViewController {

    var presta : Prestataire!
    
    @IBOutlet weak var nomLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var adresseLabel: UILabel!
    @IBOutlet weak var serviceLabel: UILabel!
    
    class func newInstance(presta: Prestataire) -> PrestataireViewController {
        let pvc = PrestataireViewController()
        pvc.presta = presta
        return pvc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nomLabel.text = "\(presta.nom) \(presta.prenom)"
        emailLabel.text = "\(presta.email)"
        adresseLabel.text = "\(presta.adresse), \(presta.cp), \(presta.ville)"
        //serviceLabel.text = ""
        // Do any additional setup after loading the view.
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
