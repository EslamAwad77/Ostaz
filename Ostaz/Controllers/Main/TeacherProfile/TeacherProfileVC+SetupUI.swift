//
//  TeacherProfileVC+SetupUI.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 05/07/2022.
//


import UIKit

extension TeacherProfileViewController {
    func setUpUI(){
        collectionViewMehtods.delegate = self
        collectionViewMehtods.dataSource = self
        collectionViewAreas.delegate = self
        collectionViewAreas.dataSource = self
        collectionViewCategoryy.delegate = self
        collectionViewCategoryy.dataSource = self
        //collectionViewHome.collectionViewLayout = UICollectionViewFlowLayout()

//        if teacherMethodsSlides.isEmpty && teacherAreasSlides.isEmpty && teacherCategoriesSlides.isEmpty {
//            self.collectionViewMehtods.isHidden = true
//            self.lblTeachingMethods.text = ""
//            self.collectionViewAreas.isHidden = true
//            self.lblCoveredArea.text = ""
//            self.collectionViewCategoryy.isHidden = true
//            self.lblCategories.text = ""
//        }
    }
    func checkUser(){
        if let apiToken = UserDefaults.standard.value(forKey: "token"){
            self.signUpView.alpha = 0
            self.scrollView.alpha = 1
        } else {
            self.signUpView.alpha = 1
            self.scrollView.alpha = 0
        }
    }
    func goToRegister(){
        self.signUpView.didClickButton = { [weak self] in
            guard let self = self else{return}
            print("did Clicked ")
            let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
            let registerVC = storyBoard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
            registerVC.modalPresentationStyle = .fullScreen
            self.present(registerVC, animated: true)
        }
    }
}
