//
//  PromotionTeacherVC+SetupUI.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 28/06/2022.
//

import UIKit

extension PromotionForTeacherVC {
    
    func setUpUI(){
        
        APIMethods.fetchingMehtodsList { error, response in
            if error != nil {
                print(error!)
            } else {
                self.teacherMethodItems = response?.arrOfList ?? []
            }
        }
        
        let m1 = TeachMethodModel()
        m1.name = "test"
        let m2 = TeachMethodModel()
        m2.name = "test2"
        let m3 = TeachMethodModel()
        m3.name = "test3"
        let m4 = TeachMethodModel()
        m4.name = "test4"
        let m5 = TeachMethodModel()
        m5.name = "test5"
        teacherMethodItems = [m1, m2, m3, m4, m5]
        
        let a1 = AreaModel()
        a1.name = "Egypt"
        let a2 = AreaModel()
        a2.name = "Mansoura"
        let a3 = AreaModel()
        a3.name = "samia Elgamal"
        TeacherAreaItems = [a1, a2, a3]
        var areas: [String] = []
        for item in TeacherAreaItems {
            areas.append(item.name)
        }
        
        //        var c1 = CollectionViewCategorySlide()
        //        c1.categoryName = "category1"
        //        var c2 = CollectionViewCategorySlide()
        //        c2.categoryName = "cat2"
        //        var c3 = CollectionViewCategorySlide()
        //        c3.categoryName = "cate3"
        //        TeachercategoryItems = [c1, c2, c3]
        //        var categories: [String] = []
        //        for item in TeachercategoryItems{
        //            categories.append(item.categoryName)
        //        }
        
        APICategory.fetchingCategory { error, response in
            if error != nil {
                print(error!)
            } else {
                self.categoryValues = response?.catArr ?? []
                for item in self.categoryValues{
                    self.categories.append(item.categoryName)
                }
                self.categoryDropDown.dataSource = self.categories
                self.categoryDropDown.reloadAllComponents()
            }
        }
        
        
        self.collectionViewAddingAreas.isHidden = true
        self.collectionViewAddingCategories.isHidden = true
        areaDropDown.dataSource = areas
        areaDropDown.anchorView = viewAreaDropDowm
        categoryDropDown.anchorView = viewCategoryDropDown
        categoryDropDown.dataSource = categories
        areaDropDown.bottomOffset = CGPoint(x: 0, y:(areaDropDown.anchorView?.plainView.bounds.height)!)
        areaDropDown.topOffset = CGPoint(x: 0, y:-(categoryDropDown.anchorView?.plainView.bounds.height)!)
        categoryDropDown.bottomOffset = CGPoint(x: 0, y:(areaDropDown.anchorView?.plainView.bounds.height)!)
        categoryDropDown.topOffset = CGPoint(x: 0, y:-(areaDropDown.anchorView?.plainView.bounds.height)!)
        areaDropDown.direction = .any
        categoryDropDown.direction = .any
        areaDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            let areaItem = selectedAreas.first { areaModel in
                if areaModel.name == item {
                    return true
                }
                return false
            }
            if areaItem == nil {
                self.collectionViewAddingAreas.isHidden = false
                self.selectedAreas.append(self.TeacherAreaItems[index])
                self.collectionViewAddingAreas.reloadData()
            }
        }
        //        categoryDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
        //            print("Selected item: \(item) at index: \(index)")
        //             let categoryItem = selectedCategories.first { categoryModel in
        //                 if categoryModel.categoryName == item{
        //                     return true
        //                 }
        //                 return false
        //            }
        //            if categoryItem == nil {
        //                self.collectionViewAddingCategories.isHidden = false
        //                self.selectedCategories.append(self.TeachercategoryItems[index])
        //                self.collectionViewAddingCategories.reloadData()
        //            }
        //
        //        }
        
        categoryDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            let catItem = selectedCategories.first { catModel in
                
                if catModel.categoryName == item{
                    
                    return true
                }
                return false
            }
            self.collectionViewAddingCategories.isHidden = false
            self.selectedCategories.append(self.categoryValues[index])
            self.collectionViewAddingCategories.reloadData()
        }
        
        collectionViewTeachMethods.delegate = self
        collectionViewTeachMethods.dataSource = self
        collectionViewAddingAreas.delegate = self
        collectionViewAddingAreas.dataSource = self
        collectionViewAddingCategories.delegate = self
        collectionViewAddingCategories.dataSource = self
    }
}
