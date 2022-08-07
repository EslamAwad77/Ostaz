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
    var filteredCategoriesSlides = [CollectionViewCategorySlide]() // take an area of memory
    
    //-------------------IBOutlet------------------------
    @IBOutlet weak var viewReloading: UIView!
    @IBOutlet weak var activityLoadingPage: UIActivityIndicatorView!
    @IBOutlet weak var viewSearch: UIView!
    @IBOutlet weak var collectionViewCategories: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lblErrorDescription: UILabel!
    @IBOutlet weak var txtFieldSearch: UITextField!
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
        txtFieldSearch.delegate = self
    }
    
//        func textField(
//            _ textField: UITextField,
//            shouldChangeCharactersIn range: NSRange,
//            replacementString string: String
//        ) -> Bool{}
    
}

extension CategoriesViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        print("text === ",textField.text!)
        if (textField.text != ""){
            self.setUpAPI()
            if txtFieldSearch.text == categoriesSlides[0].categoryName {
                
            }
            
        }
        return true
    }
   
    
}
