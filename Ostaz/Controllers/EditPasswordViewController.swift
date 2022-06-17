//
//  EditPasswordViewController.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 13/06/2022.
//

import UIKit

class EditPasswordViewController: UIViewController {
    
    //-------------------IBOutlet------------------------
    
    @IBOutlet weak var viewCurrentPassword: UIView!
    @IBOutlet weak var viewNewPassword: UIView!
    @IBOutlet weak var viewConfirmNewPass: UIView!
    @IBOutlet weak var txtFieldCurrentPassword: UITextField!
    @IBOutlet weak var txtFieldNewPassword: UITextField!
    @IBOutlet weak var txtFieldConfirmNewPassword: UITextField!
    
    //-------------------Actions------------------------
    
    @IBAction func backToAcountVC(_ sender: UIButton) {
    }
    
    @IBAction func btnShowPassword(_ sender: UIButton) {
    }
    
    @IBAction func btnConfirmNewPassword(_ sender: UIButton) {
    }
    
    //-------------------LifeCycle------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewCurrentPassword.addBorder(.top, color: UIColor.systemGray5, thickness: 1)
        self.viewCurrentPassword.addBorder(.bottom, color: UIColor.systemGray5, thickness: 1)
        self.viewCurrentPassword.addBorder(.left, color: UIColor.systemGray5, thickness: 1)
        self.viewCurrentPassword.addBorder(.right, color: UIColor.systemGray5, thickness: 1)
        self.viewNewPassword.addBorder(.top, color: UIColor.systemGray5, thickness: 1)
        self.viewNewPassword.addBorder(.bottom, color: UIColor.systemGray5, thickness: 1)
        self.viewNewPassword.addBorder(.left, color: UIColor.systemGray5, thickness: 1)
        self.viewNewPassword.addBorder(.right, color: UIColor.systemGray5, thickness: 1)
        self.viewConfirmNewPass.addBorder(.top, color: UIColor.systemGray5, thickness: 1)
        self.viewConfirmNewPass.addBorder(.bottom, color: UIColor.systemGray5, thickness: 1)
        self.viewConfirmNewPass.addBorder(.left, color: UIColor.systemGray5, thickness: 1)
        self.viewConfirmNewPass.addBorder(.right, color: UIColor.systemGray5, thickness: 1)
        
    }
}
