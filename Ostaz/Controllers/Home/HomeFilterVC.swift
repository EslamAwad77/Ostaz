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
    let categoryDropDown = DropDown()
    let cityDropDown = DropDown()
    let areaDropDown = DropDown()
    let categoryValues: [String] = ["alex", "mans"]
    let cityValues: [String] = ["alex", "mans"]
    let areaValues: [String] = ["alex library", "samia elgamal"]
    
    //-------------------Outlet---------------------------
    @IBOutlet weak var viewCategory: UIView!
    @IBOutlet weak var viewCity: UIView!
    @IBOutlet weak var viewSelectArea: UIView!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblSelectArea: UILabel!
    
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
    
    //-------------------functions---------------------------
    func setUpUIDropDown(){
        categoryDropDown.anchorView = viewCategory
        categoryDropDown.dataSource = categoryValues
        cityDropDown.anchorView = viewCity
        cityDropDown.dataSource = cityValues
        areaDropDown.anchorView = viewSelectArea
        areaDropDown.dataSource = areaValues
        cityDropDown.bottomOffset = CGPoint(x: 0, y:(categoryDropDown.anchorView?.plainView.bounds.height)!)
        cityDropDown.topOffset = CGPoint(x: 0, y:-(categoryDropDown.anchorView?.plainView.bounds.height)!)
        cityDropDown.bottomOffset = CGPoint(x: 0, y:(cityDropDown.anchorView?.plainView.bounds.height)!)
        cityDropDown.topOffset = CGPoint(x: 0, y:-(cityDropDown.anchorView?.plainView.bounds.height)!)
        areaDropDown.bottomOffset = CGPoint(x: 0, y:(areaDropDown.anchorView?.plainView.bounds.height)!)
        areaDropDown.topOffset = CGPoint(x: 0, y:-(areaDropDown.anchorView?.plainView.bounds.height)!)
        categoryDropDown.direction = .any
        cityDropDown.direction = .any
        areaDropDown.direction = .any
        categoryDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.lblCategory.text = categoryValues[index]
        }
        cityDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.lblCity.text = cityValues[index]
        }
        areaDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.lblSelectArea.text = areaValues[index]
        }
    }
}
