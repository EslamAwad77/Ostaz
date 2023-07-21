//
//  FailureAccess.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 12/06/2022.
//

import UIKit

@IBDesignable
class SignupView: UIView {
   
    //-------------------variables----------------------
    var title: String? {
        didSet {
            self.lblTitle.text = title
        }
    }
    
    var descrip: String? {
        didSet {
            self.lblDesc.text = description
        }
    }
    
    var didClickButton: (()->())?
    
    //-------------------IBOutlet-----------------------
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    //-------------------Actions------------------------
    @IBAction func resgisterClicked(_ sender: Any) {
        didClickButton?()
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
