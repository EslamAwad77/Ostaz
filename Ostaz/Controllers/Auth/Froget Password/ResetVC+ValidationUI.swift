//
//  ResetVC+ValidationUI.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 05/07/2022.
//

import Foundation
import UIKit

extension ResetPasswordVC {
    
    func goToLoginVC(){
        let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
        let loginVC = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true)
    }
    
    func setupUI(){
        lblOtpValidation.isHidden = true
        lblNewPassValidation.isHidden = true
        lblConfirmNewPassValidation.isHidden = true
    }
    
    func validation() -> Bool {
        let otp = txtFieldOtp.text!
        let newPassword = txtFieldNewPass.text!
        let confirmNewPassword = txtFieldConfirmNewPass.text!
        var flag: Bool = true
        
        if otp == "" {
            flag = false
            lblOtpValidation.isHidden = false
            lblOtpValidation.text = "Enter Otp in Your Email"
        } else {
            if let errorMessage = validateOtp(otp){
                lblOtpValidation.isHidden = false
                lblOtpValidation.text = errorMessage
            } else {
                lblOtpValidation.text = ""
                lblOtpValidation.isHidden = true
            }
            
        }
        
        if newPassword == "" {
            flag = false
            lblNewPassValidation.isHidden = false
            lblNewPassValidation.text = "Required to Enter Your Password"
        } else {
            if let errorMessage = registerVC.invalidPassword(newPassword){
                flag = false
                lblNewPassValidation.isHidden = false
                lblNewPassValidation.text = errorMessage
            } else {
                lblNewPassValidation.text = ""
                lblNewPassValidation.isHidden = true
            }
        }
        
        if confirmNewPassword == "" {
            flag = false
            lblConfirmNewPassValidation.isHidden = false
            lblConfirmNewPassValidation.text = "Required to Enter password again"
        } else {
            if confirmNewPassword != newPassword{
                flag = false
                lblConfirmNewPassValidation.isHidden = false
                lblConfirmNewPassValidation.text = "Required to Enter same password"
            } else {
                lblConfirmNewPassValidation.text = ""
                lblConfirmNewPassValidation.isHidden = true
            }
        }
        return flag
    }
    
        func validateOtp(_ otp: String) -> String? {
            let set = CharacterSet(charactersIn: otp)
            if !CharacterSet.decimalDigits.isSuperset(of: set){
                return "Otp Must Contain only Digits"
            }
            if otp.count != 4 {
                return "Otp must contain 4 number"
            } else {
                return nil
            }
        }
}
