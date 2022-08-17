//
//  HomeFilterVC.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 23/06/2022.
//

import UIKit
import DropDown

class HomeFilterVC: UIViewController {
    
    //-------------------Variables------------------------
    var cities: [String] = []
    var categories: [String] = []

    let categoryDropDown = DropDown()
    let cityDropDown = DropDown()
    let areaDropDown = DropDown()
    var categoryValues: [CategoryModel] = []
    var selectedCategory: [CategoryModel] = []
    var cityValues: [CityModel] = []
    var selectedCity: [CityModel] = []
    var areaValues: [AreaModel] = []
    var selectedArea: [AreaModel] = []
    
    //-------------------Outlet---------------------------
    @IBOutlet weak var scrollViewFilter: UIView!
    @IBOutlet weak var viewCategory: UIView!
    @IBOutlet weak var viewCity: UIView!
    @IBOutlet weak var viewSelectArea: UIView!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblSelectArea: UILabel!
    @IBOutlet weak var collViewCategories: UICollectionView!
    @IBOutlet weak var collViewCitites: UICollectionView!
    @IBOutlet weak var collViewAreas: UICollectionView!
    
    //-------------------Actions---------------------------
    @IBAction func btnCategoryDropDown(_ sender: UIButton) {
        categoryDropDown.show()
    }
    
    @IBAction func btnCityDropDown(_ sender: UIButton) {
        cityDropDown.show()
    }
    
    @IBAction func btnAreaDropDown(_ sender: UIButton) {
        areaDropDown.show()
    }
    
    @IBAction func btnConfirmFilter(_ sender: Any) {
    }
    
    //-------------------lifecycle---------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUIDropDown()
    }
}
