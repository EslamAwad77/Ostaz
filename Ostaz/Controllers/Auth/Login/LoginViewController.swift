//
//  ViewController.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 06/06/2022.
//

import UIKit
import Alamofire
import SwiftyJSON
import FirebaseMessaging
import FirebaseCore

class LoginViewController: UIViewController {
    
    //-------------------variables------------------------
    var passwordVisible: Bool = true
    var deviceToken: String = ""
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
        Messaging.messaging().token { token, error in
            if let error = error {
                print("Error fetching registration token: \(error)")
            } else if let token = token {
                print("registration token: \(token)")
                self.deviceToken  = "Remote FCM registration token: \(token)"
            }
        }
        if validation(){
            APIAuth.fetchingLogin(email: txtFieldLoginUserName.text!, password: txtFieldLoginPassword.text!) { error, response in
                if error != nil {
                    print(error!)
                    
                } else {
                    print(response?.message ?? "")
                    print(response?.user?.id ?? 0)
                    print(response?.user?.token ?? "")
                    UserDefaults.standard.set(response?.user?.token, forKey: "token")
                    self.goToHome()
                }
            }
            
            
            
            
            //            let parameters: [String: Any] = [
            //                "email": txtFieldLoginUserName.text!,
            //                "password": txtFieldLoginPassword.text!,
            //                "device_token": deviceToken,
            //                "device_type": "ios"
            //            ]
            //            let loginRequest = RequestParameter(url: URLs.login, method: .post, parameters: parameters, headers: nil) { error, json in
            //                // TODO: parse json to login
            //                if error != nil {
            //                    print(error!)
            //                } else {
            //
            //                    var result = LoginResponse()
            //                    result.message = json?["message"].string
            //                    result.user = UserModel(apiData: json?["data"].dictionaryObject)
            //
            //                    print(result.user!.id)
            //                    UserDefaults.standard.set(result.user?.token, forKey: "token")
            //                    UserDefaults.standard.set(self.deviceToken, forKey: "fcmToken")
            //                    self.goToHome()
            //                }
            //            }
            //            APIAuth.fetchingAPI(request: loginRequest)
            //
            
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




