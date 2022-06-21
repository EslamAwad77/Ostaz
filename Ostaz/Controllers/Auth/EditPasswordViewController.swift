//
//  EditPasswordViewController.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 13/06/2022.
//

import UIKit

class EditPasswordViewController: UIViewController {
    
    //-------------------IBOutlet------------------------
    
    @IBOutlet weak var viewCurrentPassword: UIView!
    @IBOutlet weak var viewNewPassword: UIView!
    @IBOutlet weak var viewConfirmNewPass: UIView!
    @IBOutlet weak var txtFieldCurrentPassword: UITextField!
    @IBOutlet weak var txtFieldNewPassword: UITextField!
    @IBOutlet weak var txtFieldConfirmNewPassword: UITextField!
    
    //-------------------Actions------------------------
    
    @IBAction func backToAcountVC(_ sender: UIButton) {
        //let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        //let vc = storyBoard.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        //vc.modalPresentationStyle = .fullScreen
        //self.present(vc, animated: true)
    }
    
    @IBAction func btnShowPassword(_ sender: UIButton) {
    }
    
    @IBAction func btnConfirmNewPassword(_ sender: UIButton) {
    }
    
    //-------------------LifeCycle------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewCurrentPassword.addborder(10)
        self.viewNewPassword.addborder(10)
        self.viewConfirmNewPass.addborder(10)
    }
}
