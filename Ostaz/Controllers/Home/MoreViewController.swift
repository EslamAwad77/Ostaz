//
//  MoreViewController.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 14/06/2022.
//

import UIKit


class MoreViewController: UIViewController {
    
    //-------------------Outlet---------------------------
    @IBOutlet weak var viewAcount: UIView!
    @IBOutlet weak var viewAboutUs: UIView!
    @IBOutlet weak var viewSpecialConditions: UIView!
    
    //-------------------Actions--------------------------
    @IBAction func GoToAccountVC(_ sender: UIButton) {
        self.goToAccount()
    }
    
    @IBAction func GoToAboutUsVC(_ sender: UIButton) {
    }
    
    @IBAction func GoToSpecialCondtionsVC(_ sender: UIButton) {
    }
    
    @IBAction func btnLogout(_ sender: UIButton) {
        
        APIAuth.fetchingLogout{ error, response in
            if error != nil {
                print(error!)
            } else {
                print(response?.message ?? "")
                UserDefaults.standard.set(nil, forKey: "token")
                self.goToLogin()
            }
        }
    }
    
    //-------------------LifeCycle------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "More"
    }
    
    //-------------------functions------------------------
    func goToLogin(){
        let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
        let loginVC = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true)
    }
    
    func goToAccount(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let acountVC = storyBoard.instantiateViewController(withIdentifier: "AcountViewController") as! AcountViewController
        acountVC.modalPresentationStyle = .fullScreen
        self.present(acountVC, animated: true)
    }
}
