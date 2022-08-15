//
//  RegisterViewController.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 06/06/2022.
//

import UIKit

class RegisterViewController: UIViewController {
    
    //-------------------variables------------------------
    var passwordVisible: Bool = true
    
    //-------------------IBOutlet------------------------
    @IBOutlet weak var viewContentPassword: UIView!
    @IBOutlet weak var viewConfirmPassword: UIView!
    
    @IBOutlet weak var txtFieldRegisterUserName: UITextField!
    @IBOutlet weak var lblUserNameValidation: UILabel!
    
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var lblEmailValidation: UILabel!
    
    @IBOutlet weak var txtFieldRegisterPassword: UITextField!
    @IBOutlet weak var lblPasswordValidation: UILabel!
    
    @IBOutlet weak var txtFieldRegisterConfirmPassword: UITextField!
    @IBOutlet weak var lblConfirmPassValidation: UILabel!
    
    //-------------------Actions------------------------
    @IBAction func btnBackLogin(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func btnShowPassword(_ sender: UIButton) {
        if passwordVisible{
            txtFieldRegisterPassword.isSecureTextEntry = false
            txtFieldRegisterConfirmPassword.isSecureTextEntry = false
            passwordVisible = false
        } else {
            txtFieldRegisterPassword.isSecureTextEntry = true
            txtFieldRegisterConfirmPassword.isSecureTextEntry = true
            passwordVisible = true
        }
    }
    
    @IBAction func btnRegisterCreateAccount(_ sender: UIButton) {
        
        if validation(){
            APIAuth.fetchingRegister(name: txtFieldRegisterUserName.text!, email: txtFieldEmail.text!, password: txtFieldRegisterPassword.text!) { error, response in
                if error != nil {
                    print(error!)
                    self.showAlert(message: error!)
                } else {
                    print(response?.message ?? "")
                    self.goToLocationVC()
                }
            }
        }
    }
    
    //-------------------LifeCycle------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        //txtFieldRegisterPassword.text = UserDefaultsManager.shared.password

    }
}

