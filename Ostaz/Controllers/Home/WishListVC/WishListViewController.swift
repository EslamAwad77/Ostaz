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
    var wishListItems = [HomeMostViewedModel]()
    
    //-------------------outlet--------------------------
    @IBOutlet weak var signupView: SignupView!
    @IBOutlet weak var tbleViewWishList: UITableView!
    @IBOutlet weak var activityLoadingPage: UIActivityIndicatorView!
    @IBOutlet weak var lblErrorDesc: UILabel!
    
    @IBOutlet weak var viewReloadData: UIView!
    //-------------------actions--------------------------
    @IBAction func btnReloadingData(_ sender: UIButton) {
        self.loadingData()
        self.activityLoadingPage.startAnimating()
        self.setUpAPI()
    }
    //-------------------lifecycle--------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Wishlist"
        self.setupUI()
    }
}

