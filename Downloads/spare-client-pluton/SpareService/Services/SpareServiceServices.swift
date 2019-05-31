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
    
    public func getServices(type: String, completion: @escaping ([[String:Any]])->Void) {
        let params = [
            "type" : type
        ]
        Alamofire.request("https://spare-api.herokuapp.com/services", parameters : params).responseJSON { (res) in
            guard let json = res.value as? [[String:Any]] else { return }
            completion(json)
        }
    }
    
    public func addAnnonce(email: String, serviceName: String, subServiceName: String, serviceDescription: String, serviceAdresse: String, completion: @escaping([[String:Any]])->Void) {
        let params = [
            "email" : email,
            "serviceName" : serviceName,
            "subServiceName" : subServiceName,
            "serviceDescription" : serviceDescription,
            "serviceAdresse" : serviceAdresse
        ]
        Alamofire.request("https://spare-api.herokuapp.com/ajoutAnnonce", method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { (res) in
            guard let json = res.value as? [[String:Any]] else {return}
            
            completion(json)
        }
    }
}
