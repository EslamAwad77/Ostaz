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
    let dropDown = DropDown()
    let cityValues: [String] = ["alex", "mans"]
    let areaValues: [String] = ["alex library", "samia elgamal"]
    
    //-------------------Outlet---------------------------
    @IBOutlet weak var viewCity: UIView!
    @IBOutlet weak var viewArea: UIView!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblArea: UILabel!
    
    //-------------------Actions--------------------------
    
    @IBAction func btnSelectCity(_ sender: UIButton) {
        dropDown.show()
    }
    
    @IBAction func btnSelectArea(_ sender: UIButton) {
        dropDown.show()
    }
    
    @IBAction func btnConfirmLocation(_ sender: UIButton) {
        
    }
    
    //-------------------LifeCycle------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    //-------------------functions------------------------
    func setUpUI(){
        
        if lblCity.isEnabled {
            dropDown.anchorView = viewCity
            dropDown.dataSource = cityValues
        }
        
        if lblArea.isEnabled{
            dropDown.anchorView = viewArea
            dropDown.dataSource = areaValues
        }
        
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.direction = .any
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.lblCity.text = cityValues[index]  // put the itemSelected in the lbl.txt
            self.lblArea.text = areaValues[index] // error he put the next area from self
        }
    }
}


