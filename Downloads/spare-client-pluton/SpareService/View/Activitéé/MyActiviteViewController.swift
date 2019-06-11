//
//  MyActiviteViewController.swift
//  SpareService
//
//  Created by oualiken ourdia on 29/05/2019.
//  Copyright © 2019 oualiken ourdia. All rights reserved.
//

import UIKit

class MyActiviteViewController: UIViewController,UITableViewDataSource {
    
    
    public static let TableViewCellId = "TABLEVIEW_IDENTIFIER_CELL_IDENTIFIER"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       /*
            let cell = tableView.dequeueReusableCell(withIdentifier: MyActiviteViewController.TableViewCellId, for: indexPath) as! TableViewCell
            cell.type.text = self.Mission.type
            return cell*/
        MyActiviteViewController.default.getSgetServices()
        
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
            let next = SubServicesViewController.newInstance(email: self.email, subServices: servicesArrayName, serviceName: serviceChoosen)
            self.navigationController?.pushViewController(next, animated: true)
        })
    }
    
    
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var segmenControl: UISegmentedControl!
    @IBOutlet var textLabel: UILabel!
    var Mission: Mission!
    var email : String = ""
    var id : String = ""
    
    
    class func newInstance(Mission: Mission,email: String, id: String) -> MyActiviteViewController {
        let mlvc = MyActiviteViewController()
        mlvc.Mission = Mission
        mlvc.email = email
        mlvc.id = id
        return mlvc
    }
    
   
    
    
    @objc func touchEditTableView() {
        UIView.animate(withDuration: 0.33) {
            self.tableView.isEditing = !self.tableView.isEditing
        }
    }

   
   
    /*
    
    @IBAction func indexChange(_ sender: Any) {
        
        
        
        switch segmenControl.selectedSegmentIndex
        {
        case 0:
            textLabel.text = "Vos demandeet et celles ou vous avez postulé apparaitront ici "
        case 1:
            textLabel.text = "une fois que votre résérvation éffectué votre demande apparaitra ici"
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

  
    }

*/
  

}
