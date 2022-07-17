//
//  ResetPasswordVC.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 05/07/2022.
//

import UIKit

class ResetPasswordVC: UIViewController {
    
    var registerVC: RegisterViewController = RegisterViewController()
    
    @IBOutlet weak var txtFieldOtp: UITextField!
    @IBOutlet weak var txtFieldNewPass: UITextField!
    @IBOutlet weak var txtFieldConfirmNewPass: UITextField!
    @IBOutlet weak var lblOtpValidation: UILabel!
    @IBOutlet weak var lblNewPassValidation: UILabel!
    @IBOutlet weak var lblConfirmNewPassValidation: UILabel!
    
    @IBAction func btnBackToFrogetPass(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnConfirmNewPassPressed(_ sender: UIButton) {
        if validation() {
            API.fetchingResetPass(otp: txtFieldOtp.text!, password: txtFieldNewPass.text!, confirmPassword: txtFieldConfirmNewPass.text!) { error, response in
                if error != nil {
                    print(error!)
                } else {
                    print(response?.message ?? "")
                    self.goToLoginVC()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
}
