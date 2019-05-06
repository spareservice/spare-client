//
//  DetailMissionViewController.swift
//  SpareService
//
//  Created by Vithursan Sivakumaran on 06/05/2019.
//  Copyright © 2019 oualiken ourdia. All rights reserved.
//

import UIKit

class DetailMissionViewController: UIViewController {

    var subServiceName : String = ""
    var serviceName : String = ""
    var serviceDescription : String = ""
    
    class func newInstance(serviceName : String, subServiceName : String, serviceDescription : String) -> DetailMissionViewController {
        let wvc = DetailMissionViewController()
        wvc.serviceName = serviceName
        wvc.subServiceName = subServiceName
        wvc.serviceDescription = serviceDescription
        return wvc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
