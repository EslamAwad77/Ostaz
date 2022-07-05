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
    
    @IBOutlet weak var PasswordCustomView: PasswordCustomView!
    
    @IBOutlet weak var txtFieldEmail: UITextField!
    
    @IBOutlet weak var btnShowPassView: UIButton!
    //-------------------Actions---------------------------
    @IBAction func btnBackToLogin(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func btnSend(_ sender: UIButton) {

        // if email true view.alpha =  1
        
        PasswordCustomView.alpha = 1
    }
    
    //-------------------lifecycle---------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.goToLogin()
    }
    
    func goToLogin(){
        self.PasswordCustomView.didClickButtonConfirm = { [weak self] in
            guard let self = self else{return}
            self.dismiss(animated: true, completion: nil)
        }
    }
}
