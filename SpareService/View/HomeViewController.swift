//
//  HomeViewController.swift
//  SpareService
//
//  Created by oualiken ourdia on 07/04/2019.
//  Copyright © 2019 oualiken ourdia. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    class func newInstance() -> HomeViewController{
        let home = HomeViewController( )
        return home
    }

    @IBAction func signUp(_ sender: UIButton) {
       // let next = LoginViewController.newInstance()
      //  self.navigationController?.pushViewController(next, animated: true)
         let next = SignUpViewController.newInstance()
         self.navigationController?.pushViewController(next, animated: true)
        
    }
    @IBAction func SignIn(_ sender: UIButton) {
        let next = SignInViewController.newInstance()
        self.navigationController?.pushViewController(next, animated: true)
      
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
        
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
