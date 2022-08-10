//
//  HomeTabBarVC.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 26/06/2022.
//

import UIKit

class HomeTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.items?[1] = UITabBarItem(title: "Account", image: UIImage(systemName: "accountIcon"), selectedImage: UIImage(systemName: "accountIcon"))
       
    }
}
