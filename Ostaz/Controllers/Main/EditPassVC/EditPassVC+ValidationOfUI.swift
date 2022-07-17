//
//  EditPassVC+ValidationOfUI.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 05/07/2022.
//

import Foundation
import UIKit

extension EditPasswordViewController{
    
    func setupUI(){
        self.viewCurrentPassword.addborder(10)
        self.viewNewPassword.addborder(10)
        self.viewConfirmNewPass.addborder(10)
        self.lblCurrentPassValidation.isHidden = true
        self.lblNewPassValidation.isHidden = true
        self.lblConfirmNewPassValidation.isHidden = true
       
    }
        
    func validation() -> Bool {
        var flag: Bool = true
        let currentPass = txtFieldCurrentPassword.text!
        let newPass = txtFieldNewPassword.text!
        let confirmNewPass = txtFieldConfirmNewPassword.text!
        
        if currentPass == ""{ //registerVC.txtFieldRegisterPassword.text!
            flag = false
            lblCurrentPassValidation.isHidden = false
            lblCurrentPassValidation.text = "Require to Enter your current Password"
        } else {
            lblCurrentPassValidation.text = ""
            lblCurrentPassValidation.isHidden = true
        }
        
        if newPass == "" {
            flag = false
            lblNewPassValidation.isHidden = false
            lblNewPassValidation.text = "Required to Enter Your Password"
        } else {
            if let errorMessage = registerVC.invalidPassword(newPass){
                flag = false
                lblNewPassValidation.isHidden = false
                lblNewPassValidation.text = errorMessage
            } else {
                lblNewPassValidation.text = ""
                lblNewPassValidation.isHidden = true
            }
        }
        
        if confirmNewPass == "" {
            flag = false
            lblConfirmNewPassValidation.isHidden = false
            lblConfirmNewPassValidation.text = "Required to Enter password again"
        } else {
            if confirmNewPass != newPass{
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
    
    func goToAccountVC(){
        self.dismiss(animated: true, completion: nil)
    }
}
