//
//  FailureAccess.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 12/06/2022.
//

import UIKit

//@IBDesignable
class SignupView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
//    var titlePage: String? {
//        didSet{
//            self.lblTitle.text = titlePage
//        }
//    }
//    var descPage: String? {
//        didSet {
//            self.lblDesc.text = descPage
//        }
//    }
    
    @IBAction func resgisterClicked(_ sender: Any) {
//        let vc = UIStoryboard(name:"Main", bundle: nil).instantiateViewController(identifier: "RegisterVC") as! RegisterViewController
//        self.navigationController?.pushViewController(vc, animated: true)
        //print("register")
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("SignupView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    }

}
