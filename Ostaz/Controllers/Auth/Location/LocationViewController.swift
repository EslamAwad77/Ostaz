//
//  LocationViewController.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 07/06/2022.
//

import UIKit
import DropDown

class LocationViewController: UIViewController{
    
    //-------------------Variables------------------------
    var areaId: Int = 0
    
    let cityDropDown = DropDown()
    let areaDropDown = DropDown()
    
    var cityValues: [CityModel] = []
    var areaValues: [AreaModel] = []
   
    var cities: [String] = []
    var areas: [String] = []

    var selectedCity: [CityModel] = []
    var selectedArea: [AreaModel] = []
  
    
    //-------------------Outlet---------------------------
    @IBOutlet weak var viewCity: UIView!
    @IBOutlet weak var viewArea: UIView!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblArea: UILabel!
    @IBOutlet weak var collViewCity: UICollectionView!
    @IBOutlet weak var collViewArea: UICollectionView!
    
    
    //-------------------Actions--------------------------
    @IBAction func btnSelectCity(_ sender: UIButton) {
        cityDropDown.show()
    }
    
    @IBAction func btnSelectArea(_ sender: UIButton) {
        areaDropDown.show()
    }
    
    @IBAction func btnConfirmLocation(_ sender: UIButton) {
        APIAuth.fetchingSetLocation(areaId: areaId) { error, response in
            if error != nil {
                print(error!)
                self.showAlert(message: error!)
            } else {
                print(response?.message ?? "")
                self.goToLoginVC()
                self.showAlert(message: response?.message ?? "")
            }
        }
    }
    
    //-------------------LifeCycle------------------------
    override func viewDidLoad(){
        super.viewDidLoad()
        self.setUpUI()
        APIAuth.fetchingAllUSerLocation {error, response in
            if error != nil {
                print(error!)
                self.showAlert(message: error!)
            } else {
                //self.selectedCity = response?.locations ?? []
                self.collViewCity.reloadData()

            }
        }
    }
    
    func getAllLocation(){
        APIAuth.fetchingAllUSerLocation { error, response in
            if error != nil {
                print(error!)
                self.showAlert(message: error!)
            } else{
                //self.sel
            }
        }
    }
}
