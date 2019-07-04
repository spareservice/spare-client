//
//  MissionSelectedViewController.swift
//  SpareService
//
//  Created by Vithursan Sivakumaran on 03/07/2019.
//  Copyright © 2019 oualiken ourdia. All rights reserved.
//

import UIKit

class MissionSelectedViewController: UIViewController {
    
    @IBOutlet weak var detailMissionLabel: UILabel!
    @IBOutlet weak var missionLabel: UILabel!
    @IBOutlet weak var detailPrestataireLabel: UILabel!
    @IBOutlet weak var prestataireLabel: UILabel!
    @IBOutlet weak var informationPrestataireLabel: UILabel!
    @IBOutlet weak var informationLabel: UILabel!
    
    var missionSelected : Mission = Mission()
    var prestataireSelected : Prestataire = Prestataire()
    
    class func newInstance(mission : Mission, prestataire : Prestataire) -> MissionSelectedViewController {
        let msvc = MissionSelectedViewController()
        msvc.missionSelected = mission
        msvc.prestataireSelected = prestataire
        return msvc
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("New View \(missionSelected) and \(prestataireSelected)")
        detailMissionLabel.text = "Détail de la mission"
        missionLabel.text = "\(missionSelected.annonce.descriptionAnnonce)\n\n\(missionSelected.annonce.detailAnnonce)\n\(missionSelected.debutDate)\n\(missionSelected.debutHeure)"
        detailPrestataireLabel.text = "Information du prestataire"
        prestataireLabel.text = "\(prestataireSelected.nom)\n\(prestataireSelected.prenom)\n\(prestataireSelected.email)\n\(prestataireSelected.tel)"
        informationPrestataireLabel.text = "Information personnelle du prestataire"
        informationLabel.text = "\(missionSelected.infoPrestataire)"
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func validerBtn(_ sender: UIButton) {
        let alert = UIAlertController(title: "Mission validé", message: "La mission avec le prestataire a été validé.\nCependant, la mission peut-être annulée par vous ou par le prestataire", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            SpareServiceServices.default.changeIsValideMission(idMission: self.missionSelected.idMission, isValide: "true", completion: { (missionValide) in
                self.navigationController?.popViewController(animated: true)
            })
        }))
        self.present(alert, animated: true)
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
