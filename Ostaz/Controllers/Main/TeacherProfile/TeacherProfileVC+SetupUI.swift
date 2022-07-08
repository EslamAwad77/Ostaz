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
        TeacherMethodsSlides = [
            CollectionViewMethodsSlide(methodName: "Online", methodImage: #imageLiteral(resourceName: "RightMark")),
            CollectionViewMethodsSlide(methodName: "Student Home", methodImage: #imageLiteral(resourceName: "RightMark")),
            CollectionViewMethodsSlide(methodName: "Teacher Place", methodImage: #imageLiteral(resourceName: "RightMark")),
            CollectionViewMethodsSlide(methodName: "Center", methodImage: #imageLiteral(resourceName: "RightMark")),
            CollectionViewMethodsSlide(methodName: "Groups", methodImage: #imageLiteral(resourceName: "RightMark"))
        ]
        TeacherAreasSlides = [
            CollectionViewAreasSlide(areaName: "Egypt", areaImage: #imageLiteral(resourceName: "locationMark")),
            CollectionViewAreasSlide(areaName: "Dakahlia", areaImage: #imageLiteral(resourceName: "locationMark")),
            CollectionViewAreasSlide(areaName: "Mansoura", areaImage: #imageLiteral(resourceName: "locationMark")),
            CollectionViewAreasSlide(areaName: "Samia El Gamal", areaImage: #imageLiteral(resourceName: "locationMark")),
            CollectionViewAreasSlide(areaName: "Ahmed Maher", areaImage: #imageLiteral(resourceName: "locationMark"))
        ]
        TeachercategoriesSlides = [
            CollectionViewTeahcerCategoriesSlide(categoryName: "Teaching", categoryImage: #imageLiteral(resourceName: "tagesMark")),
            CollectionViewTeahcerCategoriesSlide(categoryName: "Math", categoryImage: #imageLiteral(resourceName: "tagesMark")),
            CollectionViewTeahcerCategoriesSlide(categoryName: "Grade 6", categoryImage: #imageLiteral(resourceName: "tagesMark"))
        ]
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
