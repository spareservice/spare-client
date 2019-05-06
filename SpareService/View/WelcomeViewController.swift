//
//  WelcomeViewController.swift
//  SpareService
//
//  Created by oualiken ourdia on 21/04/2019.
//  Copyright © 2019 oualiken ourdia. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
 
    var services : [String] = []

    @IBOutlet var transport: UIView!
    @IBOutlet var serviceSearchBar: UISearchBar!
    @IBOutlet var serviceCollectionView: UICollectionView!
    
    
    class func newInstance(services : [String]) -> WelcomeViewController {
        let wvc = WelcomeViewController()
        wvc.services = services
        return wvc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.serviceCollectionView.delegate = self
        self.serviceCollectionView.dataSource = self
        self.serviceCollectionView.register(UINib(nibName: "ServiceCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: WelcomeViewController.servicesCellId)
        
    }


}

extension WelcomeViewController: UICollectionViewDelegate {
    
}

extension WelcomeViewController: UICollectionViewDataSource {
    
    public static let servicesCellId = "SERVICE_CELL_ID"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.services.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WelcomeViewController.servicesCellId, for: indexPath) as! ServiceCollectionViewCell
        cell.title.text = "\(services[indexPath.row])"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let serviceChoosen = services[indexPath.row]
        var servicesArrayName : [String] = []
        SpareServiceServices.default.getServices(type: serviceChoosen, completion: { res in
            res.forEach{ x in
                guard let serviceAdded = x["nomService"] as? String else { return }
                servicesArrayName.append(serviceAdded)
            }
            print(servicesArrayName)
            let next = SubServicesViewController.newInstance(subServices: servicesArrayName, serviceName: serviceChoosen)
            self.navigationController?.pushViewController(next, animated: true)
        })
    }
    
    
}
