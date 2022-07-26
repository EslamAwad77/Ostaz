//
//  SubCategoryVC+SetupUI.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 26/07/2022.
//

import UIKit

extension SubCategoryVC {
    
    func setUpUI(){
        self.loadingData()
        self.viewSearch.addborder(10)
        collectionViewSubCategory.delegate = self
        collectionViewSubCategory.dataSource = self
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
        self.viewRealoding.alpha = 0
    }
    
    
    func hideError() {
        self.scrollView.alpha = 1
        self.viewRealoding.alpha = 0
        self.activityLoadingPage.alpha = 0
    }
    
    func setUpAPI(){
        APICategory.fetchingSubCategory(id: category_id){ error, response in
            if error != nil {
                print(error!)
                self.scrollView.alpha = 0
                self.lblErrorDescrip.alpha = 1
                self.lblErrorDescrip.text = error
                
            } else {
                self.hideError()
                self.scrollView.alpha = 1
                self.lblErrorDescrip.alpha = 0
                self.lblErrorDescrip.text = ""
                
                self.subCategoriesSlides = response?.subCatArr ?? []
                print(response!)
                self.collectionViewSubCategory.reloadData()
                
                print(response?.message ?? "")

            }
        }
    }
}
