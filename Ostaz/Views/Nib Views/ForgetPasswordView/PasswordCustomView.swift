//
//  PasswordCustomView.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 21/06/2022.
//

import UIKit

@IBDesignable
class PasswordCustomView: UIView {
    
    //-------------------variables--------------------
    var didClickButtonConfirm: (()->())?
    //var didClickShowButton: (()->())?
    var passwordVisible: Bool = true
    var registerVC: RegisterViewController = RegisterViewController()
    //-------------------Outlet-----------------------
    @IBOutlet weak var txtFieldOtp: UITextField!
    @IBOutlet weak var lblOtpValidation: UILabel!
    @IBOutlet weak var txtFieldNewPassword: UITextField!
    @IBOutlet weak var lblNewPassValidation: UILabel!
    @IBOutlet weak var txtFieldConfirmPassword: UITextField!
    @IBOutlet weak var lblConfirmNewPassValidation: UILabel!
    @IBOutlet weak var viewNewPassword: UIView!
    @IBOutlet weak var viewConfirmPassword: UIView!
    
    //-------------------Actions-----------------------
    @IBAction func btnConfirm(_ sender: Any) {
        didClickButtonConfirm?()
    }
    
    @IBAction func btnShowPassword(_ sender: UIButton) {
        //didClickShowButton?()
        if passwordVisible{
            txtFieldNewPassword.isSecureTextEntry = false
            txtFieldConfirmPassword.isSecureTextEntry = false
            passwordVisible = false
        } else {
            txtFieldNewPassword.isSecureTextEntry = true
            txtFieldConfirmPassword.isSecureTextEntry = true
            passwordVisible = true
        }
    }

    //-------------------Functions-----------------------
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    func configureView(){
        guard let view = self.loadViewFromNib(nibName: "PasswordCustomView") else { return }
        view.frame = self.bounds
        self.addSubview(view)
        self.viewNewPassword.addborder(10)
        self.viewConfirmPassword.addborder(10)
        lblOtpValidation.isHidden = true
        lblNewPassValidation.isHidden = true
        lblConfirmNewPassValidation.isHidden = true
    }
    
    func validation() -> Bool {
        var flag: Bool = true
        let otp = txtFieldOtp.text!
        let newPassword = txtFieldNewPassword.text!
        let confirmNewPass = txtFieldConfirmPassword.text!
        if otp == ""{
            flag = false
            lblOtpValidation.isHidden = false
            lblOtpValidation.text = "Require to Enter your Otp message code"
        } else {
            lblOtpValidation.text = ""
            lblOtpValidation.isHidden = true
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
        
        if confirmNewPass == "" {
            flag = false
            lblConfirmNewPassValidation.isHidden = false
            lblConfirmNewPassValidation.text = "Required to Enter password again"
        } else {
            if confirmNewPass != newPassword{
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
    
    
}
