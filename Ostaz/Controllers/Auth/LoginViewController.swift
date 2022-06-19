//
//  ViewController.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 06/06/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    //-------------------IBOutlet------------------------
    
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var txtFieldLoginUserName: UITextField!
    @IBOutlet weak var txtFieldLoginPassword: UITextField!
    
    //-------------------Actions-------------------------
    
    @IBAction func btnFrogetPassword(_ sender: UIButton) {
    }
    @IBAction func btnLogin(_ sender: UIButton) {
    }
    @IBAction func btnGoToRegister(_ sender: UIButton) {
    }
    @IBAction func btnShowPassword(_ sender: UIButton) {
    }
    
    //-------------------LifeCycle------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewPassword.addborder(10)
    }
}


