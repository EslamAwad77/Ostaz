//
//  SubCategoryVC.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 17/07/2022.
//

import UIKit

class SubCategoryVC: UIViewController {
    
    //-------------------Variables------------------------
    
    var subCategoriesSlides: [CollectionViewCategorySlide] = []
    
    //-------------------IBOutlet------------------------
    @IBOutlet weak var viewSearch: UIView!
    @IBOutlet weak var collectionViewSubCategory: UICollectionView!
    
    //-------------------Actions------------------------
 
    @IBAction func btnBackToCategory(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
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
        collectionViewSubCategory.delegate = self
        collectionViewSubCategory.dataSource = self
        //collectionViewCategories.collectionViewLayout = UICollectionViewFlowLayout()
        subCategoriesSlides = [
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
    
    func setUpAPI(){
        APICategory.fetchingSubCategory{ error, response in
            if error != nil {
                print(error!)
            } else {
                print(response?.message ?? "")
                //UserDefaults.standard.set(nil, forKey: "token")
            }
        }
    }
}

//-------------------Exstensions------------------------

extension SubCategoryVC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subCategoriesSlides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubCategoryCollectionViewCell.identifier, for: indexPath) as! SubCategoryCollectionViewCell
        cell.setupUI(subCategoriesSlides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = subCategoriesSlides[indexPath.row]
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
