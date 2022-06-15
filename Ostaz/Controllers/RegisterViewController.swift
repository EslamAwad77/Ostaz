//
//  RegisterViewController.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 06/06/2022.
//

import UIKit

class RegisterViewController: UIViewController {
    
    //-------------------IBOutlet------------------------
    @IBOutlet weak var viewContentPassword: UIView!
    
    @IBOutlet weak var txtFieldPhoneNumber: UITextField!
    @IBOutlet weak var txtFieldRegisterUserName: UITextField!
    @IBOutlet weak var txtFieldRegisterPassword: UITextField!
    @IBOutlet weak var txtFieldRegisterConfirmPassword: UITextField!
    
    //-------------------Actions------------------------
    
    @IBAction func btnBackHome(_ sender: UIButton) {
    }
    
    @IBAction func btnShowPassword(_ sender: UIButton) {
    }
    
    @IBAction func btnRegisterCreateAccount(_ sender: UIButton) {
    }
    
    //-------------------LifeCycle------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewContentPassword.addBorder(.top, color: UIColor.lightGray, thickness: 1)
        viewContentPassword.addBorder(.bottom, color: UIColor.lightGray, thickness: 1)
        viewContentPassword.addBorder(.left, color: UIColor.lightGray, thickness: 1)
        viewContentPassword.addBorder(.right, color: UIColor.lightGray, thickness: 1)
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.viewContentPassword.round(self.viewContentPassword.frame.size.width/5)
//    }
}

