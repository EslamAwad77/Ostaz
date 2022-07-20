//
//  HomeViewController.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 09/06/2022.
//

import UIKit

class HomeViewController: UIViewController, UITextFieldDelegate {
    
    //-------------------Variables------------------------
    var homeMostViewedSlides: [CollectionViewHomeMostViewedSlide] = []
    var homecategoriesSlides: [CollectionViewCategorySlide] = []
    lazy var homeFilterVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeFilterVC")
    
    //-------------------IBOutlet------------------------
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewSearchWithFilter: UIView!
    @IBOutlet weak var txtFieldSearch: UITextField!
    @IBOutlet weak var collectionViewMostViewedInHome: UICollectionView!
    @IBOutlet weak var collectionViewCategoriesInHome: UICollectionView!
    
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
    
    //-------------------LifeCycle------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.setUpAPI()

    }
    
    //-------------------Functions------------------------
    
    func setUpUI(){
        self.viewSearchWithFilter.addborder(10)
        collectionViewMostViewedInHome.delegate = self
        collectionViewMostViewedInHome.dataSource = self
        collectionViewCategoriesInHome.delegate = self
        collectionViewCategoriesInHome.dataSource = self
        

        //collectionViewHome.collectionViewLayout = UICollectionViewFlowLayout()
        homeMostViewedSlides = [
            CollectionViewHomeMostViewedSlide(teacherName: "Ahmed Mohamed", teacherJob: "Music ( Guitar)", descriptionImage: #imageLiteral(resourceName: "WishListPic1"), teacherImage: #imageLiteral(resourceName: "TeacherImage")),
            CollectionViewHomeMostViewedSlide(teacherName: "Ali Ibrahim", teacherJob: "Sports ( Swimming)", descriptionImage: #imageLiteral(resourceName: "WishListPic2"), teacherImage: #imageLiteral(resourceName: "TeacherImage")),
            CollectionViewHomeMostViewedSlide(teacherName: "Reem gamal", teacherJob: "Music ( Guitar)", descriptionImage: #imageLiteral(resourceName: "WishListPic1"), teacherImage: #imageLiteral(resourceName: "TeacherImage"))
        ]

    }
    
    func setUpAPI(){
        APICategory.fetchingCategory{ error, response in
            //self.scrollView.es.stopPullToRefresh()
            //self.activityLoadingPage.stopAnimating()

            if error != nil {
                print(error!)
                //self.scrollView.alpha = 0
                //self.viewReloading.alpha = 1
                //self.lblErrorDescription.alpha = 1
               // self.lblErrorDescription.text = error
            } else {
               // self.hideError()
               // self.lblErrorDescription.alpha = 0
               // self.lblErrorDescription.text = ""
                self.homecategoriesSlides = response?.catArr ?? []
                print(response!)
                self.collectionViewCategoriesInHome.reloadData()
                print(response?.message ?? "")
            }
        }
    }
}


