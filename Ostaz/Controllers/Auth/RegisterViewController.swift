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
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldRegisterPassword: UITextField!
    @IBOutlet weak var txtFieldRegisterConfirmPassword: UITextField!
    
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
        
        guard let name = txtFieldRegisterUserName.text?.trimmed, !name.isEmpty, let email = txtFieldEmail.text?.trimmed, !email.isEmpty, let password = txtFieldRegisterPassword.text?.trimmed, !password.isEmpty, let confirmPass = txtFieldRegisterConfirmPassword.text?.trimmed, !confirmPass.isEmpty else {return}
        API.fetchingRegister(name: name, email: email, password: password) { (error: Error?, success: Bool) in
            if success {
                print("register success ")
            }
        }
        
        goToLocationVC()
    }
    
    //-------------------LifeCycle------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewContentPassword.addborder(10)
        self.viewConfirmPassword.addborder(10)
    }
}

extension RegisterViewController {
    func goToLocationVC(){
        let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
        let locationVC = storyBoard.instantiateViewController(withIdentifier: "LocationViewController") as! LocationViewController
        locationVC.modalPresentationStyle = .fullScreen
        self.present(locationVC, animated: true)
    }
}

