//
//  AcountViewController.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 14/06/2022.
//

import UIKit

class AcountViewController: UIViewController {

    //-------------------IBOutlet------------------------
    
    @IBOutlet weak var acountTeacherView: AccountTeacherView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    
    //-------------------Actions------------------------
    
    @IBAction func btnBackToMoreVC(_ sender: UIButton) {
    }
    
    @IBAction func btnGoToPasswordVC(_ sender: UIButton) {
    }
    
    @IBAction func btnGoToLocationVC(_ sender: UIButton) {
    }
    
    @IBAction func btnPromotionForTeacherVC(_ sender: UIButton) {
    }
    
    //-------------------LifeCycle------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
