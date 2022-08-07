//
//  CategoriesVC+SetupUI.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 21/07/2022.
//

import UIKit

extension CategoriesViewController {
    
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
                //self.filteredCategoriesSlides = (response?.catArr!.filter { CollResponse in
//                CollResponse.categoryName.contains()
                //})!
      
                print(response!)
                self.collectionViewCategories.reloadData()
                print(response?.message ?? "")
            }
        }
    }
}
