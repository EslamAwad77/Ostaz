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
        let c1 = CityModel()
        c1.name = "city1"
        let c2 = CityModel()
        c2.name = "city12"
        let c3 = CityModel()
        c3.name = "city123"
        cityValues = [c1, c2, c3]
        var cities: [String] = []
        for item in cityValues{
            cities.append(item.name)
        }
        let cat1 = TeacherCategoryModel()
        cat1.categoryName = "category1"
        let cat2 = TeacherCategoryModel()
        cat2.categoryName = "cat2"
        let cat3 = TeacherCategoryModel()
        cat3.categoryName = "cate3"
        categoryValues = [cat1, cat2, cat3]
        var categories: [String] = []
        for item in categoryValues{
            categories.append(item.categoryName)
        }
        
        self.collViewCategories.isHidden = true
        self.collViewCitites.isHidden = true
        self.collViewAreas.isHidden = true
        categoryDropDown.anchorView = viewCategory
        cityDropDown.anchorView = viewCity
        areaDropDown.anchorView = viewSelectArea
        categoryDropDown.dataSource = categories
        cityDropDown.dataSource = cities
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
        categoryDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            let categoryItem = selectedCategory.first { categoryModel in
                if categoryModel.categoryName == item{
                    return true
                }
                return false
            }
            if categoryItem == nil {
                self.collViewCategories.isHidden = false
                self.selectedCategory.append(self.categoryValues[index])
                self.collViewCategories.reloadData()
            }
            
        }
        cityDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            let cityItem = selectedCity.first { cityModel in
                if cityModel.name == item{
                    return true
                }
                return false
            }
            if cityItem == nil {
                self.collViewCitites.isHidden = false
                self.selectedCity.append(self.cityValues[index])
                self.collViewCitites.reloadData()
            }
            
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
        collViewCategories.delegate = self
        collViewCategories.dataSource = self
        collViewCitites.delegate = self
        collViewCitites.dataSource = self
        collViewAreas.delegate = self
        collViewAreas.dataSource = self
    }
}
