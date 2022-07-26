//
//  WishListViewController.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 14/06/2022.
//
import UIKit
import ESPullToRefresh
import PullToRefresh
import Kingfisher

class WishListViewController: UIViewController {
   
    //-------------------variables--------------------------
    var wishListPrefered: WishListModel = WishListModel()
    var wishListItems = [WishListModel]()
    
    //-------------------outlet--------------------------
    @IBOutlet weak var tbleViewWishList: UITableView!
    
    //-------------------lifecycle--------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //-------------------functions--------------------------
    func setupUI() {
        tbleViewWishList.dataSource = self
        tbleViewWishList.delegate = self
        self.tbleViewWishList.register(UINib.init(nibName: "WishListCell", bundle: nil), forCellReuseIdentifier: "WishListCell")
        self.setUpAPI()
        //tbleViewWishList.reloadData()
    }
    
    func setUpAPI(){
        APIWishlist.fetchingWishList{error, response in
            //self.tbleViewWishList.es.stopPullToRefresh()
            //self.activityLoadingPage.stopAnimating()

            if error != nil {
                print(error!)
                self.tbleViewWishList.alpha = 0
                //self.viewReloading.alpha = 1
                //self.lblErrorDescription.alpha = 1
                //self.lblErrorDescription.text = error
            } else {
                //self.hideError()
                //self.lblErrorDescription.alpha = 0
                //self.lblErrorDescription.text = ""
                self.wishListItems = response?.wishListArr ?? []
                print(response!)
                self.tbleViewWishList.reloadData()
                print(response?.message ?? "")
            }
        }
    }
}

