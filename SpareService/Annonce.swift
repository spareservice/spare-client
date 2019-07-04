//
//  Annonce.swift
//  SpareService
//
//  Created by Vithursan Sivakumaran on 02/07/2019.
//  Copyright © 2019 oualiken ourdia. All rights reserved.
//

import Foundation

public struct Annonce {
    
    var idAnnonce: String = ""
    var idClient: String = ""
    var idService: String = ""
    var descriptionAnnonce: String = ""
    var detailAnnonce: String = ""
    
    init(idAnnonce: String, idClient: String, idService: String, descriptionAnnonce: String, detailAnnonce: String) {
        self.idAnnonce = idAnnonce
        self.idClient = idClient
        self.idService = idService
        self.descriptionAnnonce = descriptionAnnonce
        self.detailAnnonce = detailAnnonce
    }
    
    init(){
        
    }
}

