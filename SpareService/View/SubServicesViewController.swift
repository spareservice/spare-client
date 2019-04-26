//
//  SubServicesViewController.swift
//  SpareService
//
//  Created by DéjàLu on 26/04/2019.
//  Copyright © 2019 oualiken ourdia. All rights reserved.
//

import UIKit

class SubServicesViewController: UIViewController {

    var subServices : [String] = []
    var serviceName : String = ""
    @IBOutlet var serviceNameLabel: UILabel!
    @IBOutlet var subServiceTableView: UITableView!
    
    class func newInstance(subServices : [String], serviceName : String) -> SubServicesViewController {
        let ssvc = SubServicesViewController()
        ssvc.subServices = subServices
        ssvc.serviceName = serviceName
        return ssvc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        serviceNameLabel.text = "Service choisi : \(serviceName)"
        
        self.subServiceTableView.delegate = self
        self.subServiceTableView.dataSource = self
        self.subServiceTableView.register(UINib(nibName: "SubServicesTableViewCell", bundle: nil), forCellReuseIdentifier: SubServicesViewController.subServiceCellId)
        
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

extension SubServicesViewController: UITableViewDelegate {
    
}

extension SubServicesViewController: UITableViewDataSource {
    
    public static let subServiceCellId = "SUBSERVICE_CELL_ID"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.subServices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SubServicesViewController.subServiceCellId, for: indexPath) as! SubServicesTableViewCell
        cell.title.text = "\(subServices[indexPath.row])"
        return cell
    }
    
    
}
