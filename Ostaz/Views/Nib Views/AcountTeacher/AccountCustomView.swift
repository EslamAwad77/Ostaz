//
//  AccountCustomView.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 21/06/2022.
//

import UIKit

@IBDesignable
class AccountCustomView: UIView {

        //-------------------IBOutlet------------------------
    
        
        //-------------------Actions------------------------
        
        @IBAction func btnGoToYourService(_ sender: UIButton) {
        }

        @IBAction func btnGoToPassword(_ sender: UIButton) {
        }
        
        @IBAction func btnGoToLocation(_ sender: UIButton) {
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
            guard let view = self.loadViewFromNib(nibName: "AccountCustomView") else { return }
            view.frame = self.bounds
            self.addSubview(view)
        }
        
//    func configurationView(name: String, phoneNumber: String){
//        lblName.text = name
//        lblPhoneNumber.text = phoneNumber
//    }
        
    


}
