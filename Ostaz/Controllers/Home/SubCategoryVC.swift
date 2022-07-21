//
//  SubCategoryVC.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 17/07/2022.
//

import UIKit

class SubCategoryVC: UIViewController {
    
    //-------------------Variables------------------------
    var category_id: Int = 0
    var subCategoriesSlides: [CollectionViewCategorySlide] = []
    
    //-------------------IBOutlet------------------------
    @IBOutlet weak var activityLoadingPage: UIActivityIndicatorView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lblErrorDescrip: UILabel!
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
    }
    
    func setUpAPI(){
        APICategory.fetchingSubCategory(id: category_id){ error, response in
            if error != nil {
                print(error!)
                self.scrollView.alpha = 0
                self.lblErrorDescrip.alpha = 1
                self.lblErrorDescrip.text = error
                
            } else {
                
                self.scrollView.alpha = 1
                self.lblErrorDescrip.alpha = 0
                self.lblErrorDescrip.text = ""
                
                self.subCategoriesSlides = response?.catArr ?? []
                print(response!)
                self.collectionViewSubCategory.reloadData()
                
                print(response?.message ?? "")

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
        let sportsVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "SportsViewController") as! SportsViewController
        sportsVC.modalPresentationStyle = .fullScreen
        sportsVC.subCategory_id = item.categoryId
        self.present(sportsVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3.5, height: 106)
    }
}
