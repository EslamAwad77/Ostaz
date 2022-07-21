//
//  TeacherProfileViewController.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 12/06/2022.
//

import UIKit

class TeacherProfileViewController: UIViewController {

    //-------------------Variables------------------------
    var TeacherMethodsSlides: [CollectionViewMethodsSlide] = []
    var TeacherAreasSlides: [CollectionViewAreasSlide] = []
    var TeachercategoriesSlides: [CollectionViewTeahcerCategoriesSlide] = []
    
    //-------------------IBOutlet------------------------
    @IBOutlet weak var signUpView: SignupView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imgViewTeacher: UIImageView!
    @IBOutlet weak var lblTeacherName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblTeacherWhatsApp: UILabel!
    @IBOutlet weak var lblTeacherFacebookAccount: UILabel!
    @IBOutlet weak var collectionViewMehtods: UICollectionView!
    @IBOutlet weak var collectionViewAreas: UICollectionView!
    @IBOutlet weak var collectionViewCategoryy: UICollectionView!
    @IBOutlet weak var lblDescriptionText: UILabel!
    @IBOutlet weak var imgViewDescription: UIImageView!
    @IBOutlet weak var lblDescriptionJobName: UILabel!
    
    //-------------------Actions------------------------
    
    @IBAction func btnReturnHome(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func btnAddToWishList(_ sender: Any) {
    }
    
    //-------------------LifeCycle------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.goToRegister()
        self.checkUser()
        self.APIProfile()
      
    }
    
    func APIProfile(){
        APIProfile.fetchingProfile { error, response in
            if error != nil {
                print(error!)
            } else {
                print(response?.profile?.email)
                print(response?.message ?? "")
                UserDefaults.standard.set(nil, forKey: "token")
            }
        }
    }
}
