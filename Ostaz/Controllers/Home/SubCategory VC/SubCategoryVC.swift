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
    var filteredSubCategoriesSlides = [CollectionViewCategorySlide]()
    
    //-------------------IBOutlet------------------------
    @IBOutlet weak var activityLoadingPage: UIActivityIndicatorView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lblErrorDescrip: UILabel!
    @IBOutlet weak var viewSearch: UIView!
    @IBOutlet weak var collectionViewSubCategory: UICollectionView!
    @IBOutlet weak var viewRealoding: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //-------------------Actions------------------------
 
    @IBAction func btnBackToCategory(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnReloadingDataPressed(_ sender: UIButton) {
        self.loadingData()
        self.activityLoadingPage.startAnimating()
        self.setUpAPI()
    }
    
    //-------------------LifeCycle------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
    }
}


extension SubCategoryVC: UISearchBarDelegate{
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        self.filteredSubCategoriesSlides = self.subCategoriesSlides
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("\(searchText)")
//        self.filteredCategoriesSlides = searchText.isEmpty ? categoriesSlides : categoriesSlides.filter({ model in
//            return model.categoryName.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
//        })
        filteredSubCategoriesSlides = []
        if searchText != "" {
           // filteredCategoriesSlides.append(contentsOf: categoriesSlides.filter({$0.categoryName.lowercased().contains(searchText.lowercased())}))
            for i in 0 ..< subCategoriesSlides.count{
                let catObj = subCategoriesSlides[i]
                if (catObj.categoryName.lowercased().contains(searchText.lowercased())){
                    filteredSubCategoriesSlides.append(catObj)
                }
            }
            self.collectionViewSubCategory.reloadData()
        } else {
            self.filteredSubCategoriesSlides = subCategoriesSlides
            self.collectionViewSubCategory.reloadData()
        }
        print("filteredCategoriesSlides: \(filteredSubCategoriesSlides.count)")
    }
}
