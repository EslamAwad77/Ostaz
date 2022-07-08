//
//  HomeViewController.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 09/06/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    //-------------------Variables------------------------
    var homeMostViewedSlides: [CollectionViewHomeMostViewedSlide] = []
    var homecategoriesSlides: [CollectionViewCategorySlide] = []
    lazy var homeFilterVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeFilterVC")
    
    //-------------------IBOutlet------------------------
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var signupView: SignupView!
    
    @IBOutlet weak var viewSearchWithFilter: UIView!
    
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
        homecategoriesSlides = [
            CollectionViewCategorySlide(categoryImage: #imageLiteral(resourceName: "musicIcon"), categoryName: "Music"),
            CollectionViewCategorySlide(categoryImage: #imageLiteral(resourceName: "quranIcon"), categoryName: "Quran"),
            CollectionViewCategorySlide(categoryImage: #imageLiteral(resourceName: "sportsIcon"), categoryName: "Sports"),
            CollectionViewCategorySlide(categoryImage: #imageLiteral(resourceName: "ProgrammingIcon"), categoryName: "Programming"),
            CollectionViewCategorySlide(categoryImage: #imageLiteral(resourceName: "UniversityIcon"), categoryName: "University"),
            CollectionViewCategorySlide(categoryImage: #imageLiteral(resourceName: "schoolIcon"), categoryName: "School")
        ]
    }
}
