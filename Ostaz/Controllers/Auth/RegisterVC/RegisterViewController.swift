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
        
        if validation() {
            API.fetchingRegister(name: txtFieldRegisterUserName.text!, email: txtFieldEmail.text!, password: txtFieldRegisterPassword.text!) { error, response in
                //
                if error != nil {
                    print(error)
                   
                } else {
                    print(response?.message)
                    self.goToLocationVC()
                }
            }
        }
    }
    
    //-------------------LifeCycle------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewContentPassword.addborder(10)
        self.viewConfirmPassword.addborder(10)
    }
        
    func validation() -> Bool {
        var flag: Bool = true
        let name = txtFieldRegisterUserName.text!
        let email = txtFieldEmail.text!
        let password = txtFieldRegisterPassword.text!
        let confirmPass = txtFieldRegisterConfirmPassword.text!
        
        if name == ""{
            flag = false
            lblUserNameValidation.isHidden = false
            lblUserNameValidation.text = "Require to Enter your name"
        } else {
            lblUserNameValidation.text = ""
            lblUserNameValidation.isHidden = true
        }
        
        if email == "" {
            flag = false
            lblEmailValidation.isHidden = false
            lblEmailValidation.text = "Required to Enter Your Email"
        } else {
            if let errorMessage = invalidEmail(email){
                flag = false
                lblEmailValidation.isHidden = false
                lblEmailValidation.text = errorMessage
            } else {
                lblEmailValidation.text = ""
                lblEmailValidation.isHidden = true
            }
        }
        
        if password == "" {
            flag = false
            lblPasswordValidation.isHidden = false
            lblPasswordValidation.text = "Required to Enter Your Password"
        } else {
            if let errorMessage = invalidPassword(password){
                flag = false
                lblPasswordValidation.isHidden = false
                lblPasswordValidation.text = errorMessage
            } else {
                lblPasswordValidation.text = ""
                lblPasswordValidation.isHidden = true
            }
        }
        
        if confirmPass == "" {
            flag = false
            lblConfirmPassValidation.isHidden = false
            lblConfirmPassValidation.text = "Required to Enter password again"
        } else {
            if confirmPass != password{
                flag = false
                lblConfirmPassValidation.isHidden = false
                lblConfirmPassValidation.text = "Required to Enter same password"
            } else {
                lblConfirmPassValidation.text = ""
                lblConfirmPassValidation.isHidden = true
            }
        }
        return flag
    }
}
  




//    func validatePhoneNumber(_ phone: String) -> String? {
//        let set = CharacterSet(charactersIn: phone)
//        if !CharacterSet.decimalDigits.isSuperset(of: set){
//            return "Phone Number Must Contain only Digits"
//        }
//        if phone.count != 11 {
//            return "Phone Number must contain 11 number"
//        } else {
//            return nil
//        }
//    }
