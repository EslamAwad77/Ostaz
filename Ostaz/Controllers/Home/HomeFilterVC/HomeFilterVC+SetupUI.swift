//
//  HomeFilterVC+SetupUI.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 07/08/2022.
//

import UIKit

extension HomeFilterVC{
    func setUpUIDropDown(){
        
        let a1 = AreaModel()
        a1.name = "Egypt"
        let a2 = AreaModel()
        a2.name = "Mansoura"
        let a3 = AreaModel()
        a3.name = "samia Elgamal"
        areaValues = [a1, a2, a3]
        var areas: [String] = []
        for item in areaValues {
            areas.append(item.name)
        }
        
        APICity.fetchingCity { error, response in
            if error != nil {
                print(error!)
            } else {
                self.cityValues = response?.cityValues ?? []
                for item in self.cityValues{
                    self.cities.append(item.name)
                }
                self.cityDropDown.dataSource = self.cities
                self.cityDropDown.reloadAllComponents()
            }
        }
        
        
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
        
        self.collViewCategories.isHidden = true
        self.collViewCitites.isHidden = true
        self.collViewAreas.isHidden = true
        categoryDropDown.anchorView = viewCategory
        cityDropDown.anchorView = viewCity
        areaDropDown.anchorView = viewSelectArea
        categoryDropDown.dataSource = categories
        areaDropDown.dataSource = areas
        categoryDropDown.bottomOffset = CGPoint(x: 0, y:(categoryDropDown.anchorView?.plainView.bounds.height)!)
        categoryDropDown.topOffset = CGPoint(x: 0, y:-(categoryDropDown.anchorView?.plainView.bounds.height)!)
        cityDropDown.bottomOffset = CGPoint(x: 0, y:(cityDropDown.anchorView?.plainView.bounds.height)!)
        cityDropDown.topOffset = CGPoint(x: 0, y:-(cityDropDown.anchorView?.plainView.bounds.height)!)
        areaDropDown.bottomOffset = CGPoint(x: 0, y:(areaDropDown.anchorView?.plainView.bounds.height)!)
        areaDropDown.topOffset = CGPoint(x: 0, y:-(areaDropDown.anchorView?.plainView.bounds.height)!)
        categoryDropDown.direction = .any
        cityDropDown.direction = .any
        areaDropDown.direction = .any

        cityDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            let cityItem = selectedCity.first { cityModel in
                
                if cityModel.name == item{
                    
                    return true
                }
                return false
            }
                self.collViewCitites.isHidden = false
                self.selectedCity.append(self.cityValues[index])
                self.collViewCitites.reloadData()
        }
        areaDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            let areaItem = selectedArea.first { areaModel in
                if areaModel.name == item {
                    return true
                }
                return false
            }
            if areaItem == nil {
                self.collViewAreas.isHidden = false
                self.selectedArea.append(self.areaValues[index])
                self.collViewAreas.reloadData()
            }
        }
        
        categoryDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            let catItem = selectedCategory.first { catModel in
                
                if catModel.categoryName == item{
                    
                    return true
                }
                return false
            }
                self.collViewCategories.isHidden = false
                self.selectedCategory.append(self.categoryValues[index])
                self.collViewCategories.reloadData()
        }
        collViewCategories.delegate = self
        collViewCategories.dataSource = self
        collViewCitites.delegate = self
        collViewCitites.dataSource = self
        collViewAreas.delegate = self
        collViewAreas.dataSource = self
    }
}





//        categoryDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
//            print("Selected item: \(item) at index: \(index)")
//            let categoryItem = selectedCategory.first { categoryModel in
//                if categoryModel.categoryName == item{
//                    return true
//                }
//                return false
//            }
//            if categoryItem == nil {
//                self.collViewCategories.isHidden = false
//                self.selectedCategory.append(self.categoryValues[index])
//                self.collViewCategories.reloadData()
//            }
//
//        }
