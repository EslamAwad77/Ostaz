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
    var homePaidInstructorsSlides = [HomeMostViewedModel]()
    var homecategoriesSlides = [HomeCategoryModel]()
    var homeMostViewedSlides = [HomeMostViewedModel]()
    lazy var homeFilterVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeFilterVC")
    
    //-------------------IBOutlet------------------------
    
    @IBOutlet weak var activityLoadingPage: UIActivityIndicatorView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewSearchWithFilter: UIView!
    @IBOutlet weak var txtFieldSearch: UITextField!
    @IBOutlet weak var collectionViewMostViewedInHome: UICollectionView!
    @IBOutlet weak var collectionViewCategoriesInHome: UICollectionView!
    @IBOutlet weak var collectionViewPiadInstInHome: UICollectionView!
    
    @IBOutlet weak var viewReloadData: UIView!
    @IBOutlet weak var lblErrorDescrip: UILabel!
    
    //-------------------Actions------------------------
    
    @IBAction func btnSearchResult(_ sender: UIButton) {
        
        
        
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
        //
        //        var homePaid1: HomePaidInstructorsModel = HomePaidInstructorsModel()
        //        homePaid1.name = "ahmed"
        //        homePaid1.teacherCategory = []
        //        var t1 = HomeCategoryModel()
        //        t1.categoryName = "math"
        //        t1.categoryImage = "https://images.ctfassets.net/hrltx12pl8hq/a2hkMAaruSQ8haQZ4rBL9/8ff4a6f289b9ca3f4e6474f29793a74a/nature-image-for-website.jpg?fit=fill&w=480&h=320"
        //        homePaid1.teacherCategory.append(t1)
        //        homePaid1.image = "https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072821__480.jpg"
        //
        //        var homePaid2: HomePaidInstructorsModel = HomePaidInstructorsModel()
        //        homePaid2.name = "ali"
        //        homePaid2.teacherCategory = []
        //        var t2 = HomeCategoryModel()
        //        t2.categoryName = "math2"
        //        t2.categoryImage = "https://images.ctfassets.net/hrltx12pl8hq/a2hkMAaruSQ8haQZ4rBL9/8ff4a6f289b9ca3f4e6474f29793a74a/nature-image-for-website.jpg?fit=fill&w=480&h=320"
        //        homePaid2.teacherCategory.append(t2)
        //        homePaid2.image = "https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072821__480.jpg"
        //
        //        homePaidInstructorsSlides = [homePaid1, homePaid2]
        // self.collectionViewPiadInstInHome.reloadData()
        
    }
    
    
    func gotToSearchResult(){
        
        let storyBoard = UIStoryboard(name: "Home", bundle: nil)
        let homeSearchVC = storyBoard.instantiateViewController(withIdentifier: "HomeSearchVC") as! HomeSearchVC
        homeSearchVC.modalPresentationStyle = .fullScreen
        self.present(homeSearchVC, animated: true)
    }
}


//search result vc        // المفروض دا ف ال

//        let parameters = [
//            "text": txtFieldSearch.text!,
//            "specialization": "",
//            "city": "",
//            "area": ""
//        ]
//        let token = UserDefaults.standard.value(forKey: "token") as? String
//        let bearerToken =  token != nil ? "Bearer \(token!)" : ""    // ternary Operator
//        let searchRequest = RequestParameter(url: URLs.search, method: .post, parameters: parameters, headers: ["Authorization": bearerToken]) { error, json in
//            if error != nil {
//                print(error!)
//            } else {
//
//                var result = SearchResponse()
//                result.message = json?["message"].string
//                result.homeSearch = []
//                let apiSearch = json?["data"]["data"].arrayObject
//                for item in apiSearch ?? []{
//                    let model = HomeMostViewedModel.init(apiData: item as? [String: Any])
//                    result.homeSearch?.append(model)
//                    self.gotToSearchResult()
//                }
//            }
//        }
//        GeneralAPI.fetchingData(request: searchRequest)
//
//
