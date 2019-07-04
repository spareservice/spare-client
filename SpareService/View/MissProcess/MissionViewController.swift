//
//  MissionViewController.swift
//  SpareService
//
//  Created by Vithursan Sivakumaran on 25/06/2019.
//  Copyright © 2019 oualiken ourdia. All rights reserved.
//

import UIKit

class MissionViewController: UIViewController {

    @IBOutlet weak var missionTableView: UITableView!
    
    var missions : [Mission] = []
    
    class func newInstance(missions : [Mission]) -> MissionViewController {
        let mvc = MissionViewController()
        mvc.missions = missions
        return mvc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(missions)
        self.missionTableView.delegate = self
        self.missionTableView.dataSource = self
        self.missionTableView.register(UINib(nibName: "MissionTableViewCell", bundle: nil), forCellReuseIdentifier: MissionViewController.missionCellId)
    }
}

extension MissionViewController: UITableViewDelegate {
    
}

extension MissionViewController: UITableViewDataSource {
    
    public static let missionCellId = "MISSION_CELL_ID"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.missions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MissionViewController.missionCellId, for: indexPath) as! MissionTableViewCell
        cell.date.text = "\(missions[indexPath.row].debutDate) à \(missions[indexPath.row].debutHeure)"
        cell.descriptionAnnonce.text = "\(missions[indexPath.row].annonce.descriptionAnnonce)"
        cell.detailAnnonce.text = "\(missions[indexPath.row].annonce.detailAnnonce)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMission = missions[indexPath.row]
        let selectedPrestataire = missions[indexPath.row].idPrestataire
        
        SpareServiceServices.default.getPrestataireById(idPrestataire: selectedPrestataire) { (prestataire) in
            guard let nomPrestataire = prestataire[0]["nom"] as? String,
                    let prenomPrestataire = prestataire[0]["prenom"] as? String,
                    let emailPrestataire = prestataire[0]["email"] as? String,
                    let telPrestataire = prestataire[0]["tel"] as? String,
                    let adressePrestataire = prestataire[0]["adresse"] as? String,
                    let villePrestataire = prestataire[0]["ville"] as? String,
                    let cpPrestataire = prestataire[0]["cp"] as? String else {return}
            let next = MissionSelectedViewController.newInstance(mission: selectedMission, prestataire: Prestataire(nom: nomPrestataire, prenom: prenomPrestataire, services: ["service1"], email: emailPrestataire, tel: telPrestataire, adresse: adressePrestataire, cp: cpPrestataire, ville: villePrestataire))
            self.navigationController?.pushViewController(next, animated: true)
        }
    }
    
    
}
