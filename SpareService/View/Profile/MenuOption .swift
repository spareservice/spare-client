//
//  MenuOption .swift
//  SpareService
//
//  Created by oualiken ourdia on 30/05/2019.
//  Copyright © 2019 oualiken ourdia. All rights reserved.
//

import Foundation
enum MenuOption: Int, CustomStringConvertible {
    case Profile
    case Paiment
    case Aide
    case Settings
    
    
    
    var description: String {
        switch self {
        case .Profile: return "Profile"
        case .Paiment: return "Paiment"
        case .Aide: return "Aide"
        case .Settings: return "Settings"
        }
    }
    
    
}
