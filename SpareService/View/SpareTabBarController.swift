//
//  SpareTabBarController.swift
//  SpareService
//
//  Created by oualiken ourdia on 28/05/2019.
//  Copyright © 2019 oualiken ourdia. All rights reserved.
//

import UIKit

class SpareTabBarController: UITabBarController {
    
    class func newInstance(email: String, services: [String]) -> SpareTabBarController {
        let controller = SpareTabBarController();
        
        let welcomeNavigation = UINavigationController(rootViewController: WelcomeViewController.newInstance(email: email, services: services))
        let activityNavigation = UINavigationController(rootViewController: MyActiviteViewController())
        
        controller.tabBar.tintColor = .red
        
        welcomeNavigation.tabBarItem.title = "Home"
        activityNavigation.tabBarItem.title = "Activité"
        activityNavigation.tabBarItem.image = UIImage(named: "briefcase")

        controller.setViewControllers([
            welcomeNavigation,
            activityNavigation
            ], animated: false)
        
        return controller
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
}
