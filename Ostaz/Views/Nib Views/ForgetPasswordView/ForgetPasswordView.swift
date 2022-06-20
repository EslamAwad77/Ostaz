//
//  ForgetPasswordView.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 20/06/2022.
//

import UIKit

class ForgetPasswordView: UIView {
    //-------------------Outlet-----------------------
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var txtFieldNewPassword: UITextField!
    @IBOutlet weak var txtFieldConfirmPassword: UITextField!
    @IBOutlet weak var viewNewPassword: UIView!
    @IBOutlet weak var viewConfirmPassword: UIView!
    
    //-------------------Actions-----------------------
    @IBAction func btnConfirm(_ sender: UIButton) {
    }
    @IBAction func btnShowPassword(_ sender: UIButton) {
    }
    
    
    //-------------------Functions-----------------------
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("ForgetPasswordView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    }
}
