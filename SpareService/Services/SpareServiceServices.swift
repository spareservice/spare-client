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
    
    public func addAnnonce(email: String, serviceName: String, subServiceName: String, serviceDescription: String, serviceAdresse: String, debutDate: String, debutHeure: String, completion: @escaping([[String:Any]])->Void) {
        let params = [
            "email" : email,
            "serviceName" : serviceName,
            "subServiceName" : subServiceName,
            "serviceDescription" : serviceDescription,
            "serviceAdresse" : serviceAdresse,
            "debutDate": debutDate,
            "debutHeure": debutHeure
        ]
        Alamofire.request("http://localhost:3000/ajoutAnnonce", method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { (res) in
            guard let json = res.value as? [[String:Any]] else {return}
            
            completion(json)
        }
    }
    
    public func getAllPrestataire(completion: @escaping([[String:Any]]) -> Void) {
        Alamofire.request("https://spare-api.herokuapp.com/prestataire").responseJSON { (res) in
            guard let json = res.value as? [[String:Any]] else { return }
            completion(json)
        }
    }
    
    public func getPrestataireByEmail(email: String, completion: @escaping ([[String:Any]])->Void) {
        let params = [
            "email" : email
        ]
        Alamofire.request("http://localhost:3000/prestataireByEmail", parameters : params).responseJSON { (res) in
            guard let json = res.value as? [[String:Any]] else { return }
            completion(json)
        }
    }
    
    public func getMissionClient(id: String, completion: @escaping ([[String:Any]])->Void) {
        let params = [
            "id" : id
        ]
        Alamofire.request("http://localhost:3000/getMissionClient", parameters : params).responseJSON { (res) in
            guard let json = res.value as? [[String:Any]] else { return }
            completion(json)
        }
    }
    
    public func getAnnonceById(idAnnonce :String, completion: @escaping ([[String:Any]])->Void) {
        
        Alamofire.request("http://localhost:3000/getAnnonceById/\(idAnnonce)").responseJSON { (res) in
            guard let json = res.value as? [[String:Any]] else { return }
            completion(json)
        }
    }
    
    public func getPrestataireById(idPrestataire: String, completion: @escaping ([[String:Any]])->Void) {
        
        Alamofire.request("http://localhost:3000/getPrestataireById/\(idPrestataire)").responseJSON { (res) in
            guard let json = res.value as? [[String:Any]] else { return }
            completion(json)
        }
    }
    
    public func changeIsValideMission(idMission: String, isValide: String, completion: @escaping ([[String:Any]])-> Void) {
        let params = [
            "isValide" : isValide
        ]
        Alamofire.request("http://localhost:3000/missionChangeIsValide/\(idMission)", method: .patch, parameters : params).responseJSON { (res) in
            guard let json = res.value as? [[String:Any]] else { return }
            completion(json)
        }
    }

    
}
