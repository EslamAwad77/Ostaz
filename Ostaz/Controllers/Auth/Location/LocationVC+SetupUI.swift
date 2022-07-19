//
//  LocationVC+SetupUI.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 19/07/2022.
//

import UIKit

extension LocationViewController {
    
    func setUpUI(){
        let a1 = AreaModel()
        a1.name = "Egypt"
        let a2 = AreaModel()
        a2.name = "Mansoura"
        let a3 = AreaModel()
        a3.name = "samia Elgamal"
        areaValues = [a1, a2, a3]
        var areas: [String] = []
        for item in areaValues {
            areas.append(item.name ?? "")
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
            cities.append(item.name ?? "")
        }
        
        self.collViewCity.isHidden = true
        self.collViewArea.isHidden = true
        cityDropDown.anchorView = viewCity
        areaDropDown.anchorView = viewArea
        areaDropDown.dataSource = areas
        cityDropDown.dataSource = cities
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
            if cityItem == nil {
                self.collViewCity.isHidden = false
                self.selectedCity.append(self.cityValues[index])
                self.collViewCity.reloadData()
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
                self.collViewArea.isHidden = false
                self.selectedArea.append(self.areaValues[index])
                self.collViewArea.reloadData()
            }
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
