//
//  HomeVC+SetupUI.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 21/07/2022.
//

import UIKit

extension HomeViewController {
    
    func setUpUI(){
        self.loadingData()
        self.viewSearchWithFilter.addborder(10)
        collectionViewMostViewedInHome.delegate = self
        collectionViewMostViewedInHome.dataSource = self
        collectionViewCategoriesInHome.delegate = self
        collectionViewCategoriesInHome.dataSource = self
        self.setupTableRefresh()
        self.setUpAPI()
        

        //collectionViewHome.collectionViewLayout = UICollectionViewFlowLayout()
        homeMostViewedSlides = [
            CollectionViewHomeMostViewedSlide(teacherName: "Ahmed Mohamed", teacherJob: "Music ( Guitar)", descriptionImage: #imageLiteral(resourceName: "WishListPic1"), teacherImage: #imageLiteral(resourceName: "TeacherImage")),
            CollectionViewHomeMostViewedSlide(teacherName: "Ali Ibrahim", teacherJob: "Sports ( Swimming)", descriptionImage: #imageLiteral(resourceName: "WishListPic2"), teacherImage: #imageLiteral(resourceName: "TeacherImage")),
            CollectionViewHomeMostViewedSlide(teacherName: "Reem gamal", teacherJob: "Music ( Guitar)", descriptionImage: #imageLiteral(resourceName: "WishListPic1"), teacherImage: #imageLiteral(resourceName: "TeacherImage"))
        ]
    }
    
    func setUpAPI(){
        APICategory.fetchingCategory{ error, response in
            self.scrollView.es.stopPullToRefresh()
            self.activityLoadingPage.stopAnimating()

            if error != nil {
                print(error!)
                self.scrollView.alpha = 0
                self.viewReloadData.alpha = 1
                self.lblErrorDescrip.alpha = 1
                self.lblErrorDescrip.text = error
            } else {
                self.hideError()
                self.lblErrorDescrip.alpha = 0
                self.lblErrorDescrip.text = ""
                self.homecategoriesSlides = response?.catArr ?? []
                print(response!)
                self.collectionViewCategoriesInHome.reloadData()
                print(response?.message ?? "")
            }
        }
    }
    
    func loadingData() {
        self.scrollView.alpha = 0
        self.viewReloadData.alpha = 0
    }
    
    
    func hideError() {
        self.scrollView.alpha = 1
        self.viewReloadData.alpha = 0
        self.activityLoadingPage.alpha = 0
    }
    
    func setupTableRefresh(){
        //if refresh from top
        self.scrollView.es.addPullToRefresh { [weak self] in
            guard let self = self else { return }
            self.setUpAPI()
            print("top")
        }
    }
}
