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

//-------------------Exstensions------------------------

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewMostViewedInHome{
            return homeMostViewedSlides.count
        }
        return homecategoriesSlides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionViewMostViewedInHome{
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: HomeMostViewedCollectionViewCell.identifier, for: indexPath) as! HomeMostViewedCollectionViewCell
            cell1.setup(homeMostViewedSlides[indexPath.row])
            return cell1
        } else{
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCategoriesCollectionViewCell.identifier, for: indexPath) as! HomeCategoriesCollectionViewCell
            cell2.setupUI (homecategoriesSlides[indexPath.row])
            return cell2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionViewMostViewedInHome{
            let item = homeMostViewedSlides[indexPath.row]
            if item.teacherName == "Reem gamal"{
                let teacherVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TeacherProfileViewController") as! TeacherProfileViewController
                teacherVC.modalPresentationStyle = .fullScreen
                self.present(teacherVC, animated: true)
            }
        } else{
            let item = homecategoriesSlides[indexPath.row]
            if item.categoryName == "Sports"{
                let sportsVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "SportsViewController") as! SportsViewController
                sportsVC.modalPresentationStyle = .fullScreen
                self.present(sportsVC, animated: true)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionViewMostViewedInHome{
            return CGSize(width: collectionView.frame.width*0.6, height: collectionView.frame.height)
        } else {
            return CGSize(width: collectionView.frame.width/3.5, height: 95)
        }
    }
}

