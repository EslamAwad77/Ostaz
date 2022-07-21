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
    //var ArrOfUserData: [UserModel] = []
    //-------------------IBOutlet------------------------
    
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var txtFieldLoginUserName: UITextField!
    @IBOutlet var lblEmailValidation: UILabel!
    @IBOutlet weak var txtFieldLoginPassword: UITextField!
    @IBOutlet var lblPasswordValidation: UILabel!
    //-------------------Actions-------------------------
    
    @IBAction func btnFrogetPassword(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
        let forgetPasswordVC = storyBoard.instantiateViewController(withIdentifier: "ForgetPasswordVC") as! ForgetPasswordVC
        forgetPasswordVC.modalPresentationStyle = .fullScreen
        self.present(forgetPasswordVC, animated: true)
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        
        if validation(){
            APIAuth.fetchingLogin(email: txtFieldLoginUserName.text!, password: txtFieldLoginPassword.text!) { error, response in
                if error != nil {
                    print(error!)
                    
                } else {
                    

                    //self.ArrOfUserData = response?.user ?? []
                    print(response?.message ?? "")
                    print(response?.user!)
                    //print(response?.user?.last)
                    print(response?.user?.token ?? "")
                    UserDefaults.standard.set(response?.user?.token, forKey: "token")
                    //UserDefaults.standard.set(response?.user?.last, forKey: "token")
                    self.goToHome()
                }
            }
        }
 
    }
    
    @IBAction func btnGoToRegister(_ sender: UIButton) {
        self.goToRegister()
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
        self.setupUI()
    }
}




