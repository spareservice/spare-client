//
//  Profil.swift
//  SpareService
//
//  Created by oualiken ourdia on 30/05/2019.
//  Copyright © 2019 oualiken ourdia. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Profil: ImmutableMappable {
    
    var name : String
    

    public init(map: Map) throws {
         self.name = try map.value("name")
      
    }
    
    public func mapping(map: Map) {
         self.name >>> map["name"]
    }
    
    
    init(name: String){
          self.name = name
    }
    
    
    
}
