//
//  RegiserVC+ValidationOfUI.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 03/07/2022.
//

import Foundation
import UIKit

extension RegisterViewController{
    
    func goToLocationVC(){
        let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
        let locationVC = storyBoard.instantiateViewController(withIdentifier: "LocationViewController") as! LocationViewController
        locationVC.modalPresentationStyle = .fullScreen
        self.present(locationVC, animated: true)
    }
    
    func invalidEmail(_ value: String) -> String?
    {
        let reqularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        if !predicate.evaluate(with: value)
        {
            return "Invalid Email Address"
        }
        
        return nil
    }
    
    func invalidPassword(_ value: String) -> String?
    {
        if value.count < 8
        {
            return "Password must be at least 8 characters"
        }
        if containsDigit(value)
        {
            return "Password must contain at least 1 digit"
        }
        if containsLowerCase(value)
        {
            return "Password must contain at least 1 lowercase character"
        }
        if containsUpperCase(value)
        {
            return "Password must contain at least 1 uppercase character"
        }
        return nil
    }
    
    func containsDigit(_ value: String) -> Bool
    {
        let reqularExpression = ".*[0-9]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        return !predicate.evaluate(with: value)
    }
    
    func containsLowerCase(_ value: String) -> Bool
    {
        let reqularExpression = ".*[a-z]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        return !predicate.evaluate(with: value)
    }
    
    func containsUpperCase(_ value: String) -> Bool
    {
        let reqularExpression = ".*[A-Z]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        return !predicate.evaluate(with: value)
    }
    
    func setupUI(){
        self.viewContentPassword.addborder(10)
        self.viewConfirmPassword.addborder(10)
        self.lblUserNameValidation.isHidden = true
        self.lblEmailValidation.isHidden = true
        self.lblPasswordValidation.isHidden = true
        self.lblConfirmPassValidation.isHidden = true
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
