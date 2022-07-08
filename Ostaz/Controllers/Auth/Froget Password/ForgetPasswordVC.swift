//
//  ForgetPasswordVC.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 20/06/2022.
//

import UIKit

class ForgetPasswordVC: UIViewController {
    
    var registerVC: RegisterViewController = RegisterViewController()
    
    //-------------------Outlet---------------------------
    @IBOutlet weak var txtFieldEmail: UITextField!
    
    @IBOutlet weak var lblEmailValidation: UILabel!
    //-------------------Actions---------------------------
    @IBAction func btnBackToLogin(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func btnSend(_ sender: UIButton) {
        if validation(){
            API.fetchingFrogetPass(email: txtFieldEmail.text!) { error, response in
                if error != nil {
                    print(error!)
                } else {
                    print(response?.message ?? "")
                    self.goToResetPasswordVC()
                }
            }
        }
    }
    
    //-------------------lifecycle---------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    func setupUI(){
        lblEmailValidation.isHidden = true
    }
    
    func goToResetPasswordVC(){
        let resetVC = UIStoryboard(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "ResetPasswordVC") as! ResetPasswordVC
        resetVC.modalPresentationStyle = .fullScreen
        self.present(resetVC, animated: true, completion: nil)
    }
    
    func validation() -> Bool {
        let email = txtFieldEmail.text!
        var flag: Bool = true
        if email == ""{
            flag = false
            lblEmailValidation.isHidden = false
            lblEmailValidation.text = "Enter Your Email"
        } else {
            lblEmailValidation.text = ""
            lblEmailValidation.isHidden = true
            self.goToResetPasswordVC()
        }
        return flag
    }
}
