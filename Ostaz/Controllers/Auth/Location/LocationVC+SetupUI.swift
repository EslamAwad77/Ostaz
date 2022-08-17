//
//  LocationVC+SetupUI.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 19/07/2022.
//

import UIKit

extension LocationViewController {
    
    func setUpUI(){
        
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
        
        
        self.collViewCity.isHidden = true
        self.collViewArea.isHidden = true
        cityDropDown.anchorView = viewCity
        areaDropDown.anchorView = viewArea
        cityDropDown.bottomOffset = CGPoint(x: 0, y:(cityDropDown.anchorView?.plainView.bounds.height)!)
        cityDropDown.topOffset = CGPoint(x: 0, y:-(cityDropDown.anchorView?.plainView.bounds.height)!)
        areaDropDown.bottomOffset = CGPoint(x: 0, y:(areaDropDown.anchorView?.plainView.bounds.height)!)
        areaDropDown.topOffset = CGPoint(x: 0, y:-(areaDropDown.anchorView?.plainView.bounds.height)!)
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
            self.collViewCity.isHidden = false
            self.selectedCity.append(self.cityValues[index])
            
            let citiesId = selectedCity.map{ model in
                return model.id
            }
            print(citiesId)
            //return
            APIArea.fetchingArea(citiesId: citiesId) {error, response in
                if error != nil {
                    print(error!)
                } else {
                    self.areaValues = response?.areaValues ?? []
                    for item in self.areaValues {
                        self.areas.append(item.name)
                    }
                    self.areaDropDown.dataSource = self.areas
                    self.areaDropDown.reloadAllComponents()
                }
            }
            self.collViewCity.reloadData()
            
        }
        
        
        
        areaDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            let areaItem = selectedArea.first { areaModel in
                if areaModel.name == item {
                    return true
                }
                return false
            }
            self.collViewArea.isHidden = false
            self.selectedArea.append(self.areaValues[index])
            let areasId = selectedArea.map { model in
                return model.id
            }
            self.collViewArea.reloadData()
        }
        collViewCity.delegate = self
        collViewCity.dataSource = self
        collViewArea.delegate = self
        collViewArea.dataSource = self
    }
    
    func goToLoginVC(){
        let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
        let loginVC = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true)
    }
}
