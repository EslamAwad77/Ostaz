//
//  CategoriesViewController.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 14/06/2022.
//

import UIKit

class CategoriesViewController: UIViewController {
   
    //-------------------Variables------------------------
    
    var categoriesSlides: [CollectionViewCategorySlide] = []
    
    //-------------------IBOutlet------------------------
    @IBOutlet weak var viewSearch: UIView!
    
    @IBOutlet weak var collectionViewCategories: UICollectionView!
    
    //-------------------Actions------------------------
    
    @IBAction func btnSearchCategoryResult(_ sender: Any) {
    }
    
   
    //-------------------LifeCycle------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.setUpUI()
    }
    
    //-------------------Functions------------------------
    
    func setUpUI(){
        self.viewSearch.addborder(10)
        collectionViewCategories.delegate = self
        collectionViewCategories.dataSource = self
        //collectionViewCategories.collectionViewLayout = UICollectionViewFlowLayout()
        categoriesSlides = [
            CollectionViewCategorySlide(categoryImage: #imageLiteral(resourceName: "musicIcon"), categoryName: "Music"),
            CollectionViewCategorySlide(categoryImage: #imageLiteral(resourceName: "quranIcon"), categoryName: "Quran"),
            CollectionViewCategorySlide(categoryImage: #imageLiteral(resourceName: "sportsIcon"), categoryName: "Sports"),
            CollectionViewCategorySlide(categoryImage: #imageLiteral(resourceName: "ProgrammingIcon"), categoryName: "Programming"),
            CollectionViewCategorySlide(categoryImage: #imageLiteral(resourceName: "UniversityIcon"), categoryName: "University"),
            CollectionViewCategorySlide(categoryImage: #imageLiteral(resourceName: "schoolIcon"), categoryName: "School"),
            CollectionViewCategorySlide(categoryImage: #imageLiteral(resourceName: "musicIcon"), categoryName: "Music"),
            CollectionViewCategorySlide(categoryImage: #imageLiteral(resourceName: "quranIcon"), categoryName: "Quran"),
            CollectionViewCategorySlide(categoryImage: #imageLiteral(resourceName: "sportsIcon"), categoryName: "Sports"),
            CollectionViewCategorySlide(categoryImage: #imageLiteral(resourceName: "ProgrammingIcon"), categoryName: "Programming"),
            CollectionViewCategorySlide(categoryImage: #imageLiteral(resourceName: "UniversityIcon"), categoryName: "University"),
            CollectionViewCategorySlide(categoryImage: #imageLiteral(resourceName: "schoolIcon"), categoryName: "School"),
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

extension CategoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoriesSlides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.identifier, for: indexPath) as! CategoriesCollectionViewCell
        cell.setupUI(categoriesSlides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = categoriesSlides[indexPath.row]
        if item.categoryName == "Sports"{
            let sportsVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "SportsViewController") as! SportsViewController
            sportsVC.modalPresentationStyle = .fullScreen
            self.present(sportsVC, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3.5, height: 106)
    }
}
