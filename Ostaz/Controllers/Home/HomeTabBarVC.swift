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
//        self.tabBarController?.tabBar.items?[1] = UITabBarItem(title: "Account", image: UIImage(systemName: "accountIcon"), selectedImage: UIImage(systemName: "accountIcon"))
//
    }
    
    func setupUI(){
        let homeVC = HomeViewController()
        let categoryVC = CategoriesViewController()
        let wishListVC = WishListViewController()
        let moreVC = MoreViewController()
        let accountVC = AcountViewController()
        
        
        self.setViewControllers([homeVC, categoryVC, wishListVC, moreVC], animated: false)
        
        guard let items = self.tabBar.items  else {return}
        
        let images = ["homeIcons", "caterageIcon", "wishListIcon", "moreIcon"]
        
        for x in 0...3 {
            items[x].image = UIImage(systemName: images[x])
        }
        
        self.tabBarController?.tabBar.items?[1] = UITabBarItem.init(title: "Account", image: UIImage(systemName: "accountIcon"), selectedImage: UIImage(systemName: "accountIcon"))
    }
}
