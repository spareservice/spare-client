//
//  SignInViewController.swift
//  SpareService
//
//  Created by oualiken ourdia on 10/04/2019.
//  Copyright © 2019 oualiken ourdia. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    class func newInstance() -> SignInViewController {
        
        let mlvc = SignInViewController()
        return mlvc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func connect(_ sender: Any) {
        let next = WelcomeViewController.newInstance()
        self.navigationController?.pushViewController(next, animated: true)
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        
        
    }

   
}
