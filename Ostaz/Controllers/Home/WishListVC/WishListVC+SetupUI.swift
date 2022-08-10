//
//  WishListVC+SetupUI.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 10/08/2022.
//

import UIKit
import ESPullToRefresh
import PullToRefresh

extension WishListViewController {
    func setupUI() {
        tbleViewWishList.dataSource = self
        tbleViewWishList.delegate = self
        self.goToRegister()
        self.checkUser()
        self.loadingData()
     
        self.tbleViewWishList.register(UINib.init(nibName: "WishListCell", bundle: nil), forCellReuseIdentifier: "WishListCell")
        self.activityLoadingPage.startAnimating()
        self.setupTableRefresh()
        self.setUpAPI()
        //tbleViewWishList.reloadData()
    }
    
    func setUpAPI(){
        APIWishlist.fetchingWishList{error, response in
            self.tbleViewWishList.es.stopPullToRefresh()
            self.activityLoadingPage.stopAnimating()

            if error != nil {
                print(error!)
                self.tbleViewWishList.alpha = 0
                self.viewReloadData.alpha = 1
                self.lblErrorDesc.alpha = 1
                self.lblErrorDesc.text = error
            } else {
                self.hideError()
                self.lblErrorDesc.alpha = 0
                self.lblErrorDesc.text = ""
                self.wishListItems = response?.wishListArr ?? []
                print(response!)
                self.tbleViewWishList.reloadData()
                print(response?.message ?? "")
            }
        }
    }
    
    func loadingData() {
        self.tbleViewWishList.alpha = 0
        self.viewReloadData.alpha = 0
    }
    
    
    func hideError() {
        self.tbleViewWishList.alpha = 1
        self.viewReloadData.alpha = 0
        self.activityLoadingPage.alpha = 0
    }
    
    func setupTableRefresh(){
        //if refresh from top
        self.tbleViewWishList.es.addPullToRefresh { [weak self] in
            guard let self = self else { return }
            self.setUpAPI()
            print("top")
        }
    }
    func checkUser(){
        if let apiToken = UserDefaults.standard.value(forKey: "token"){
            self.signupView.alpha = 0
            self.tbleViewWishList.alpha = 1
        } else {
            self.signupView.alpha = 1
            self.tbleViewWishList.alpha = 0
        }
    }
    func goToRegister(){
        self.signupView.didClickButton = { [weak self] in
            guard let self = self else{return}
            print("did Clicked ")
            let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
            let registerVC = storyBoard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
            registerVC.modalPresentationStyle = .fullScreen
            self.present(registerVC, animated: true)
        }
    }
}
