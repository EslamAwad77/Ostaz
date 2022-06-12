//
//  TeacherProfileViewController.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 12/06/2022.
//

import UIKit

class TeacherProfileViewController: UIViewController {

    //-------------------IBOutlet------------------------
    
    @IBOutlet weak var signUpView: SignupView!
    @IBOutlet weak var imgViewTeacher: UIImageView!
    @IBOutlet weak var lblTeacherName: UILabel!
    @IBOutlet weak var lblTeacherPhone: UILabel!
    @IBOutlet weak var lblTeacherWhatsApp: UILabel!
    @IBOutlet weak var lblTeacherFacebookAccount: UILabel!
    @IBOutlet weak var imgViewService: UIImageView!
    @IBOutlet weak var lblServiceDescription: UILabel!
    
    //-------------------Actions------------------------
    
    @IBAction func btnReturnHome(_ sender: UIButton) {
    }
    
    @IBAction func btnAddToWishList(_ sender: Any) {
    }
    
    //-------------------LifeCycle------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
