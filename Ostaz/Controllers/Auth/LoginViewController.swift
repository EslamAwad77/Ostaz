//
//  ViewController.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 06/06/2022.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController {
   
    //-------------------variables------------------------
    var passwordVisible: Bool = true

    
    //-------------------IBOutlet------------------------
    
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var txtFieldLoginUserName: UITextField!
    @IBOutlet weak var txtFieldLoginPassword: UITextField!
    
    //-------------------Actions-------------------------
    
    @IBAction func btnFrogetPassword(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
        let forgetPasswordVC = storyBoard.instantiateViewController(withIdentifier: "ForgetPasswordVC") as! ForgetPasswordVC
        forgetPasswordVC.modalPresentationStyle = .fullScreen
        self.present(forgetPasswordVC, animated: true)
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        guard let email = txtFieldLoginUserName.text, !email.isEmpty else {return}
        guard let password = txtFieldLoginPassword.text, !password.isEmpty else {return}
        API.fetchingLogin(email: email, password: password){ (error: Error?, success: Bool) in
            if success {
                        print("hello")
            } else {
                // sorry and try agian
            }
            
        }
        goToHome()
        
    }
    
    @IBAction func btnGoToRegister(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
        let registerVC = storyBoard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        registerVC.modalPresentationStyle = .fullScreen
        self.present(registerVC, animated: true)
    }
    @IBAction func btnShowPassword(_ sender: UIButton) {
        if passwordVisible{
            txtFieldLoginPassword.isSecureTextEntry = false
            passwordVisible = false
        } else {
            txtFieldLoginPassword.isSecureTextEntry = true
            passwordVisible = true
        }
        
        
    }
    
    //-------------------LifeCycle------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFieldLoginPassword.clearsOnBeginEditing = false
        self.viewPassword.addborder(10)
    }
}

extension LoginViewController {
    func goToHome(){
        let storyBoard = UIStoryboard(name: "Home", bundle: nil)
        let homeVC = storyBoard.instantiateViewController(withIdentifier: "HomeTabBarVC") as! HomeTabBarVC
        homeVC.modalPresentationStyle = .fullScreen
        self.present(homeVC, animated: true)
    }
}


