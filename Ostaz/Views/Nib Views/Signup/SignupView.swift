//
//  FailureAccess.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 12/06/2022.
//

import UIKit

@IBDesignable
class SignupView: UIView {
    
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
        //let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        //let vc = storyBoard.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        //vc.modalPresentationStyle = .fullScreen
        //self.present(vc, animated: true)
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
