//
//  Mission.swift
//  SpareService
//
//  Created by Vithursan Sivakumaran on 25/06/2019.
//  Copyright © 2019 oualiken ourdia. All rights reserved.
//

import Foundation

public struct Mission {
    
    var idMission: String = ""
    var idClient: String = ""
    var idPrestataire: String = ""
    var idAnnonce: String = ""
    var debutDate: String = ""
    var debutHeure: String = ""
    var infoPrestataire: String = ""
    var isValide: String = ""
    var inProcess: String = ""
    var annonce: Annonce = Annonce()
    
    init(idMission: String, idClient: String, idPrestataire: String, idAnnonce: String, debutDate: String, debutHeure: String, infoPrestataire: String, isValide: String, inProcess: String, annonce: Annonce) {
        self.idMission = idMission
        self.idClient = idClient
        self.idPrestataire = idPrestataire
        self.idAnnonce = idAnnonce
        self.debutDate = debutDate
        self.debutHeure = debutHeure
        self.infoPrestataire = infoPrestataire
        self.isValide = isValide
        self.inProcess = inProcess
        self.annonce = annonce
    }
    
    init(){}
}
