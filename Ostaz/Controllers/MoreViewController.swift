//
//  MoreViewController.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 14/06/2022.
//

import UIKit
import DropDown

class MoreViewController: UIViewController {
    
    //-------------------Variables------------------------
    let dropDown = DropDown()
    let accountValues: [String] = ["alex", "mans"]
    let abouUsValues: [String] = ["alex library", "samia elgamal"]
    let specialConditionsValues: [String] = ["library", "elgamal"]
    
    //-------------------Outlet---------------------------
    @IBOutlet weak var viewAcount: UIView!
    @IBOutlet weak var viewAboutUs: UIView!
    @IBOutlet weak var viewSpecialConditions: UIView!
    @IBOutlet weak var lblAcount: UILabel!
    @IBOutlet weak var lblAboutUs: UILabel!
    @IBOutlet weak var lblSpecialCondition: UILabel!
    
    //-------------------Actions--------------------------
    @IBAction func btnAcountDropDown(_ sender: UIButton) {
        dropDown.show()
    }
    
    @IBAction func btnAboutUsDropDown(_ sender: UIButton) {
        dropDown.show()
    }
    
    @IBAction func btnSpecialConditionDropDown(_ sender: UIButton) {
        dropDown.show()
    }
    
    @IBAction func btnLogout(_ sender: UIButton) {
    }
    
    //-------------------LifeCycle------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    //-------------------functions------------------------
    func setUpUI(){
        
        if lblAcount.isEnabled {
            dropDown.anchorView = viewAcount
            dropDown.dataSource = accountValues
        }

        if lblAboutUs.isEnabled{
            dropDown.anchorView = viewAboutUs
            dropDown.dataSource = abouUsValues
        }
        
        if lblSpecialCondition.isEnabled{
            dropDown.anchorView = viewSpecialConditions
            dropDown.dataSource = specialConditionsValues
        }

        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.direction = .any
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.lblAcount.text = accountValues[index]  // put the itemSelected in the lbl.txt
            self.lblAboutUs.text = abouUsValues[index] // error he put the next area from self
            self.lblSpecialCondition.text = specialConditionsValues[index]
        }
    }
}
