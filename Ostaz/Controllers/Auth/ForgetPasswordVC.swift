//
//  ForgetPasswordVC.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 20/06/2022.
//

import UIKit

class ForgetPasswordVC: UIViewController {
    
    //-------------------Outlet---------------------------
    
    @IBOutlet weak var PasswordCustomView: PasswordCustomView!
    
    @IBOutlet weak var txtFieldEmail: UITextField!
    
    @IBOutlet weak var btnShowPassView: UIButton!
    //-------------------Actions---------------------------
    @IBAction func btnBackToLogin(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func btnSend(_ sender: UIButton) {
        
    }
    
    //-------------------lifecycle---------------------------

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
