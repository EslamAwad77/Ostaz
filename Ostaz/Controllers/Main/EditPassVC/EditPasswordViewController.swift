//
//  EditPasswordViewController.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 13/06/2022.
//

import UIKit

class EditPasswordViewController: UIViewController {
    
    //-------------------variables------------------------
    var passwordVisible: Bool = true
    var registerVC: RegisterViewController = RegisterViewController()
    
    //-------------------IBOutlet------------------------
    @IBOutlet weak var viewCurrentPassword: UIView!
    @IBOutlet weak var viewNewPassword: UIView!
    @IBOutlet weak var viewConfirmNewPass: UIView!
    @IBOutlet weak var txtFieldCurrentPassword: UITextField!
    @IBOutlet weak var  lblCurrentPassValidation: UILabel!
    @IBOutlet weak var txtFieldNewPassword: UITextField!
    @IBOutlet weak var lblNewPassValidation: UILabel!
    @IBOutlet weak var txtFieldConfirmNewPassword: UITextField!
    @IBOutlet weak var lblConfirmNewPassValidation: UILabel!
    
    //-------------------Actions------------------------
    @IBAction func backToAcountVC(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnShowPassword(_ sender: UIButton) {
        if passwordVisible{
            txtFieldCurrentPassword.isSecureTextEntry = false
            txtFieldNewPassword.isSecureTextEntry = false
            txtFieldConfirmNewPassword.isSecureTextEntry = false
            passwordVisible = false
        } else {
            txtFieldCurrentPassword.isSecureTextEntry = true
            txtFieldNewPassword.isSecureTextEntry = true
            txtFieldConfirmNewPassword.isSecureTextEntry = true
            passwordVisible = true
        }
    }
    
    @IBAction func btnConfirmNewPassword(_ sender: UIButton) {
        if validation(){
            self.goToAccountVC()
        }
    }
    
    //-------------------LifeCycle------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
}
