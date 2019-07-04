//
//  Prestataire.swift
//  SpareService
//
//  Created by Vithursan Sivakumaran on 12/06/2019.
//  Copyright © 2019 oualiken ourdia. All rights reserved.
//

import Foundation

public struct Prestataire {
    
    var nom: String = ""
    var prenom: String = ""
    var services: [String] = []
    var email: String = ""
    var tel: String = ""
    var adresse: String = ""
    var cp: String = ""
    var ville: String = ""
    
    init(nom: String, prenom: String, services: [String], email: String, tel: String, adresse: String, cp: String, ville: String) {
        self.nom = nom
        self.prenom = prenom
        self.services = services
        self.email = email
        self.tel = tel
        self.adresse = adresse
        self.cp = cp
        self.ville = ville
    }
    
    init(){}
}
