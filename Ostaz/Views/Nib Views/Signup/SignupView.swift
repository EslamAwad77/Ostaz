//
//  FailureAccess.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 12/06/2022.
//

import UIKit

@IBDesignable
class SignupView: UIView {
   
    //-------------------IBOutlet-----------------------
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    //-------------------Actions------------------------
    @IBAction func btnBackToHome(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Home", bundle: nil)
        let homeVC = storyBoard.instantiateViewController(withIdentifier: "HomeTabBarVC") as! HomeTabBarVC
        homeVC.modalPresentationStyle = .fullScreen
        //self.inputViewController?.showDetailViewController(homeVC, sender: nil)
        //self.present(homeVC, animated: true)
        //let nav = UINavigationController()
        //nav.pushViewController(homeVC, animated: true)
        //nav.popViewController(animated: true)
    }
    
    @IBAction func resgisterClicked(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
        let registerVC = storyBoard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        registerVC.modalPresentationStyle = .fullScreen
        //self.present(registerVC, animated: true)
//        let nav = UINavigationController()
//        nav.pushViewController(registerVC, animated: true)
    }

    //-------------------Functions-----------------------
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    func configureView(){
        guard let view = self.loadViewFromNib(nibName: "SignupView") else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
//    func configurationView(name: String, phoneNumber: String){
//        lblName.text = name
//        lblPhoneNumber.text = phoneNumber
//    }

}
