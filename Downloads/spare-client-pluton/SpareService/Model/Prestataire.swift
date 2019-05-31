//
//  Prestataire.swift
//  SpareService
//
//  Created by oualiken ourdia on 31/05/2019.
//  Copyright © 2019 oualiken ourdia. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Prestataire: ImmutableMappable {
    
    var name : String?
    var salaire : Int?
    var codePostal : Int?
    var Profession: String?
    
    public init(map: Map) throws {
        self.name = try map.value("name")
        
    }
  
    public mutating func mapping(map: Map) {
        self.name >>> map["name"]
        self.salaire >>> map["salaire"]
        self.codePostal >>> map["status"]
         self.Profession >>> map["Profession"]
       
    }
    
    
    init(name: String, salaire: Int, codePostal:Int, Profession:String ){
        self.name = name
        self.salaire = salaire
        self.codePostal = codePostal
        self.Profession = Profession
    }
    
    
    
}
