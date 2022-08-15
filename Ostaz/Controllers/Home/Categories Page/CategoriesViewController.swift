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
    
    var categoriesSlides = [CollectionViewCategorySlide]()
    var filteredCategoriesSlides = [CollectionViewCategorySlide]()
    
    //-------------------IBOutlet------------------------
    @IBOutlet weak var viewReloading: UIView!
    @IBOutlet weak var activityLoadingPage: UIActivityIndicatorView!
    @IBOutlet weak var viewSearch: UIView!
    @IBOutlet weak var collectionViewCategories: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lblErrorDescription: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    
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
        title = "Categories"
        self.setUpUI()
    }
}

extension CategoriesViewController: UISearchBarDelegate{
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        self.filteredCategoriesSlides = self.categoriesSlides
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("\(searchText)")
//        self.filteredCategoriesSlides = searchText.isEmpty ? categoriesSlides : categoriesSlides.filter({ model in
//            return model.categoryName.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
//        })
        filteredCategoriesSlides = []
        if searchText != "" {
           // filteredCategoriesSlides.append(contentsOf: categoriesSlides.filter({$0.categoryName.lowercased().contains(searchText.lowercased())}))
            for i in 0 ..< categoriesSlides.count{
                let catObj = categoriesSlides[i]
                if (catObj.categoryName.lowercased().contains(searchText.lowercased())){
                    filteredCategoriesSlides.append(catObj)
                }
            }
            self.collectionViewCategories.reloadData()
        } else {
            self.filteredCategoriesSlides = categoriesSlides
            self.collectionViewCategories.reloadData()
        }
        print("filteredCategoriesSlides: \(filteredCategoriesSlides.count)")
    }
}
