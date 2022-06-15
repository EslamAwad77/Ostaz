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
        self.viewPassword.addBorder(.top, color: UIColor.lightGray, thickness: 1)
        self.viewPassword.addBorder(.bottom, color: UIColor.lightGray, thickness: 1)
        self.viewPassword.addBorder(.left, color: UIColor.lightGray, thickness: 1)
        self.viewPassword.addBorder(.right, color: UIColor.lightGray, thickness: 1)
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.viewPassword.round(self.viewPassword.frame.size.width/5)
//    }
}


