//
//  LoginVC+Extensions.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 05/07/2022.
//

import Foundation
import UIKit

extension LoginViewController {
   
    func setupUI(){
        txtFieldLoginPassword.clearsOnBeginEditing = false
        self.viewPassword.addborder(10)
        self.lblEmailValidation.isHidden = true
        self.lblPasswordValidation.isHidden = true
    }
    
    func validation() -> Bool {
        var flag: Bool = true
        let email = txtFieldLoginUserName.text!
        let password = txtFieldLoginPassword.text!
        if email == ""{
            flag = false
            lblEmailValidation.isHidden = false
            lblEmailValidation.text = "Require to Enter your email"
        } else {
            lblEmailValidation.text = ""
            lblEmailValidation.isHidden = true
        }
        if password == "" {
            flag = false
            lblPasswordValidation.isHidden = false
            lblPasswordValidation.text = "Required to Enter Your Password"
        } else {
            lblPasswordValidation.text = ""
            lblPasswordValidation.isHidden = true
        }
        return flag
    }
    
    func goToHome(){
        let storyBoard = UIStoryboard(name: "Home", bundle: nil)
        let homeVC = storyBoard.instantiateViewController(withIdentifier: "HomeTabBarVC") as! HomeTabBarVC
        homeVC.modalPresentationStyle = .fullScreen
        self.present(homeVC, animated: true)
    }
    
    func goToRegister(){
        let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
        let registerVC = storyBoard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        registerVC.modalPresentationStyle = .fullScreen
        self.present(registerVC, animated: true)
    }
}
