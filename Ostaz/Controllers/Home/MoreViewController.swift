//
//  MoreViewController.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 14/06/2022.
//

import UIKit


class MoreViewController: UIViewController {
    
    //-------------------Variables------------------------
  
    
    //-------------------Outlet---------------------------
    @IBOutlet weak var viewAcount: UIView!
    @IBOutlet weak var viewAboutUs: UIView!
    @IBOutlet weak var viewSpecialConditions: UIView!
    
    //-------------------Actions--------------------------
    @IBAction func GoToAccountVC(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let acountVC = storyBoard.instantiateViewController(withIdentifier: "AcountViewController") as! AcountViewController
        acountVC.modalPresentationStyle = .fullScreen
        self.present(acountVC, animated: true)
    }
    
    @IBAction func GoToAboutUsVC(_ sender: UIButton) {
        //let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        //let vc = storyBoard.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        //vc.modalPresentationStyle = .fullScreen
        //self.present(vc, animated: true)
    }
    
    @IBAction func GoToSpecialCondtionsVC(_ sender: UIButton) {
        //let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        //let vc = storyBoard.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        //vc.modalPresentationStyle = .fullScreen
        //self.present(vc, animated: true)
    }
    @IBAction func btnLogout(_ sender: UIButton) {
        
        API.fetchingLogout { error, response in
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
    }
    
    //-------------------functions------------------------
    func goToLogin(){
        let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
        let loginVC = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true)
    }
}
