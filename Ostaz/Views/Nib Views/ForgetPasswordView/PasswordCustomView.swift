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
    
    var passwordVisible: Bool = true
    
    //-------------------Outlet-----------------------
    
    @IBOutlet weak var txtFieldOtp: UITextField!
    @IBOutlet weak var txtFieldNewPassword: UITextField!
    @IBOutlet weak var txtFieldConfirmPassword: UITextField!
    @IBOutlet weak var viewNewPassword: UIView!
    @IBOutlet weak var viewConfirmPassword: UIView!
    
    //-------------------Actions-----------------------
    @IBAction func btnConfirm(_ sender: UIButton) {
        
    }
    
    @IBAction func btnShowPassword(_ sender: UIButton) {
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
    }
}
