//
//  HomeViewController.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 09/06/2022.
//

import UIKit
import ESPullToRefresh
import PullToRefresh

class HomeViewController: UIViewController, UITextFieldDelegate {
    
    //-------------------Variables------------------------
    var homeMostViewedSlides: [CollectionViewHomeMostViewedSlide] = []
    var homecategoriesSlides: [CollectionViewCategorySlide] = []
    lazy var homeFilterVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeFilterVC")
    
    //-------------------IBOutlet------------------------
    
    @IBOutlet weak var activityLoadingPage: UIActivityIndicatorView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewSearchWithFilter: UIView!
    @IBOutlet weak var txtFieldSearch: UITextField!
    @IBOutlet weak var collectionViewMostViewedInHome: UICollectionView!
    @IBOutlet weak var collectionViewCategoriesInHome: UICollectionView!
    @IBOutlet weak var viewReloadData: UIView!
    @IBOutlet weak var lblErrorDescrip: UILabel!
    
    //-------------------Actions------------------------
    
    @IBAction func btnSearchResult(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Home", bundle: nil)
        let homeSearchVC = storyBoard.instantiateViewController(withIdentifier: "HomeSearchVC") as! HomeSearchVC
        homeSearchVC.modalPresentationStyle = .fullScreen
        self.present(homeSearchVC, animated: true)
    }
    
    @IBAction func btnHomeFilter(_ sender: UIButton) {
        if let sheet = homeFilterVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 38
        }
        self.present(homeFilterVC, animated: true, completion: nil)
    }
    
    @IBAction func btnGoToCategories(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Home", bundle: nil)
        let categoriesVC = storyBoard.instantiateViewController(withIdentifier: "CategoriesViewController") as! CategoriesViewController
        categoriesVC.modalPresentationStyle = .fullScreen
        self.present(categoriesVC, animated: true)
    }
    
    @IBAction func btnReloadingData(_ sender: UIButton) {
        self.loadingData()
        self.activityLoadingPage.startAnimating()
        self.setUpAPI()
        
    }
    
    //-------------------LifeCycle------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.setUpAPI()

    }
    
}


