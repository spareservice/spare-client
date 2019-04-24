//
//  SpareServiceServices.swift
//  SpareService
//
//  Created by DéjàLu on 22/04/2019.
//  Copyright © 2019 oualiken ourdia. All rights reserved.
//

import Foundation
import Alamofire

public class SpareServiceServices {
    public static let `default` = SpareServiceServices()
    
    private init() {
        
    }
    
    public func addClientDetail(nom: String, prenom: String, email: String, mdp: String, tel: String, completion: @escaping ([[String:Any]])->Void) {
        Alamofire.request("https://spare-api.herokuapp.com/\(nom)/\(prenom)/\(email)/\(mdp)/\(tel)/ajoutClient", method: .post, parameters: [:], encoding: JSONEncoding.default).responseJSON { (res) in
            guard let json = res.value as? [[String:Any]] else {return}
            
            completion(json)
        }
    }
    
    public func getClientDetail(email: String, mdp: String, completion: @escaping ([[String:Any]])->Void) {
        Alamofire.request("https://spare-api.herokuapp.com/\(email)/\(mdp)/connexionClient").responseJSON { (res) in
            guard let json = res.value as? [[String:Any]] else { return }
            completion(json)
        }
    }
    
    public func checkClient(email: String, completion: @escaping ([[String:Any]])->Void) {
        Alamofire.request("https://spare-api.herokuapp.com/\(email)/checkClient").responseJSON { (res) in
            guard let json = res.value as? [[String:Any]] else { return }
            completion(json)
        }
    }
    
    public func getPrincipalServices(completion: @escaping ([String])->Void) {
        Alamofire.request("https://spare-api.herokuapp.com/servicesPrincipaux").responseJSON { (res) in
            guard let json = res.value as? [String] else { return }
            completion(json)
        }
    }
}
