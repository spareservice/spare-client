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
    
    public func addClientDetail(nom: String, prenom: String, email: String, mdp: String, tel: String, completion: @escaping ( DataResponse<Any>)->Void) {
        Alamofire.request("http://localhost:3000/\(nom)/\(prenom)/\(email)/\(mdp)/\(tel)/ajoutClient", method: .post, parameters: [:], encoding: JSONEncoding.default).responseJSON { (res) in
            print(res)
            completion(res)
        }
    }
    
    public func getClientDetail(email: String, mdp: String, completion: @escaping ( DataResponse<Any>)->Void) {
        Alamofire.request("http://localhost:3000/\(email)/\(mdp)/connexionClient", method: .get, encoding: JSONEncoding.default).responseJSON { (res) in
            print(res)
            completion(res)
        }
    }
}
