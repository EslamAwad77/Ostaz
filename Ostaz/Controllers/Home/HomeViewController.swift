//
//  HomeViewController.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 09/06/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    //-------------------IBOutlet------------------------
    @IBOutlet weak var viewSearchWithFilter: UIView!
    
    @IBOutlet weak var collectionViewMostViewedInHome: UICollectionView!
    
    @IBOutlet weak var collectionViewCategoriesInHome: UICollectionView!
    
    //-------------------Variables------------------------
    
    var homeMostViewedSlides: [CollectionViewHomeMostViewedSlide] = []
    var homecategoriesSlides: [CollectionViewCategorySlide] = []
    
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
            CollectionViewHomeMostViewedSlide(teacherName: "Teacher Name", teacherJob: "Music ( Guitar)", descriptionImage: #imageLiteral(resourceName: "WishListPic1"), teacherImage: #imageLiteral(resourceName: "TeacherImage")),
            CollectionViewHomeMostViewedSlide(teacherName: "Teacher Name", teacherJob: "Sports ( Swimming)", descriptionImage: #imageLiteral(resourceName: "WishListPic2"), teacherImage: #imageLiteral(resourceName: "TeacherImage")),
            CollectionViewHomeMostViewedSlide(teacherName: "Teacher Name", teacherJob: "Music ( Guitar)", descriptionImage: #imageLiteral(resourceName: "WishListPic1"), teacherImage: #imageLiteral(resourceName: "TeacherImage"))
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
        //let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        //let vc = storyBoard.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        //vc.modalPresentationStyle = .fullScreen
        //self.present(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionViewMostViewedInHome{
            return CGSize(width: collectionView.frame.width*0.6, height: collectionView.frame.height)
        } else {
            return CGSize(width: 115, height: 106)
            //return CGSize(width: collectionView.frame.width*0.3, height: collectionView.frame.height*0.1)
        }
    }
}

