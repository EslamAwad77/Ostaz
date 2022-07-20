//
//  CategoriesViewController.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 14/06/2022.
//

import UIKit
import ESPullToRefresh
import PullToRefresh

class CategoriesViewController: UIViewController {
    
    //-------------------Variables------------------------
    
    var categoriesSlides: [CollectionViewCategorySlide] = []
    
    //-------------------IBOutlet------------------------
    @IBOutlet weak var viewReloading: UIView!
    @IBOutlet weak var activityLoadingPage: UIActivityIndicatorView!
    @IBOutlet weak var viewSearch: UIView!
    @IBOutlet weak var collectionViewCategories: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lblErrorDescription: UILabel!
    
    //-------------------Actions------------------------
    @IBAction func btnReloadingData(_ sender: UIButton) {
        self.loadingData()
        self.activityLoadingPage.startAnimating()
        self.setUpAPI()
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
        self.loadingData()
        self.viewSearch.addborder(10)
        collectionViewCategories.delegate = self
        collectionViewCategories.dataSource = self
        self.activityLoadingPage.startAnimating()
        self.setupTableRefresh()
        self.setUpAPI()
        
    }
    
    func setupTableRefresh(){
        //if refresh from top
        self.scrollView.es.addPullToRefresh { [weak self] in
            guard let self = self else { return }
            self.setUpAPI()
            print("top")
        }
    }
    
    func loadingData() {
        self.scrollView.alpha = 0
        self.viewReloading.alpha = 0
    }
    
    
    func hideError() {
        self.scrollView.alpha = 1
        self.viewReloading.alpha = 0
        self.activityLoadingPage.alpha = 0
    }
    
    func setUpAPI(){
        APICategory.fetchingCategory{ error, response in
            self.scrollView.es.stopPullToRefresh()
            self.activityLoadingPage.stopAnimating()

            if error != nil {
                print(error!)
                self.scrollView.alpha = 0
                self.viewReloading.alpha = 1
                self.lblErrorDescription.alpha = 1
                self.lblErrorDescription.text = error
            } else {
                self.hideError()
                self.lblErrorDescription.alpha = 0
                self.lblErrorDescription.text = ""
                self.categoriesSlides = response?.catArr ?? []
                print(response!)
                self.collectionViewCategories.reloadData()
                print(response?.message ?? "")
            }
        }
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
        let subCategoryVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "SubCategoryVC") as! SubCategoryVC
        subCategoryVC.modalPresentationStyle = .fullScreen
        subCategoryVC.category_id = item.categoryId
        self.present(subCategoryVC, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3.5, height: 106)
    }
}
