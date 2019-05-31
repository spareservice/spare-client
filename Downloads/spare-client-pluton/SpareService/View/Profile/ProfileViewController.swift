//
//  ProfileViewController.swift
//  SpareService
//
//  Created by oualiken ourdia on 28/05/2019.
//  Copyright © 2019 oualiken ourdia. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController{
    
    var profil: Profil!
    @IBOutlet var tableView: UITableView!
    
    class func newInstance(profil: Profil) -> ProfileViewController {
        let mlvc = ProfileViewController()
        mlvc.profil = profil
        return mlvc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib(nibName: "ProfilCellul", bundle: nil), forCellReuseIdentifier: ProfileViewController.profilCellId)
       
    }
    
    @objc func touchEditTableView() {
        UIView.animate(withDuration: 0.33) {
            self.tableView.isEditing = !self.tableView.isEditing
        }
    }
    
    

}

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let detail = DetaillProfil.newInstance(profilInstance: self.profil)
       self.navigationController?.pushViewController(detail, animated: true)
    }
}



extension ProfileViewController: UITableViewDataSource {
    
        public static let profilCellId = "PROFIL_CELL_IDENTIFIER"
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: ProfileViewController.profilCellId, for: indexPath) as! ProfilCellul
        cell.name.text = self.profil.name
        return cell
    }
    
    
    
}
