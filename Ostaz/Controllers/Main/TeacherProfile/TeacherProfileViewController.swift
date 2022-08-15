//
//  TeacherProfileViewController.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 12/06/2022.
//

import UIKit
import Kingfisher

class TeacherProfileViewController: UIViewController {
    
    //-------------------Variables------------------------
    var instructorId: Int = 0
    var isActive: Bool = true
    var teacherMethodsSlides: [MethodModel] = []
    var teacherAreasSlides: [AreaModel] = []
    var teacherCategoriesSlides: [HomeCategoryModel] = []
    
    //-------------------IBOutlet------------------------
    @IBOutlet weak var lblErrorDesc: UILabel!
    @IBOutlet weak var viewReloading: UIView!
    @IBOutlet weak var activityLoadingPage: UIActivityIndicatorView!
    @IBOutlet weak var btnAddToWishlist: UIButton!
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
    @IBOutlet weak var lblTeachingMethods: UILabel!
    @IBOutlet weak var lblCoveredArea: UILabel!
    @IBOutlet weak var lblCategories: UILabel!
    @IBOutlet weak var lblCources: UILabel!
    //-------------------Actions------------------------
    
    @IBAction func btnReturnHome(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func btnErrorReloading(_ sender: UIButton) {
        self.loadingData()
        self.activityLoadingPage.startAnimating()
        self.APIUserProfile()
    }
    @IBAction func btnAddToWishList(_ sender: Any) {
        if self.isActive {
            self.btnAddToWishlist.tintColor = UIColor.red
            self.btnAddToWishlist.setImage(UIImage(named: "WishlistactiveMark"), for: .normal)
            self.isActive = false
        } else{
            self.btnAddToWishlist.tintColor = UIColor.black
            self.btnAddToWishlist.setImage(UIImage(named: "wishListIcon"), for: .normal)
            self.isActive = true
        }
        
        APIWishlist.fetchingAddToWishList(favouriteId: instructorId) { error, response in
            if error != nil{
                print(error!)
            } else {
                // if click on button add to wish list
             
                print(response?.message ?? "")
            }
        }
        //TODO: if he will update APIUpdate here and replace wish list button to edit button
    }
    
    
    
    
    //-------------------LifeCycle------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.goToRegister()
        self.checkUser()
        self.APIUserProfile()
    }
    
    func APIUserProfile(){
        APIProfile.fetchingShowProfile(istructorId: instructorId){ error, response in
            if error != nil {
                print(error!)
                self.scrollView.alpha = 0
                self.viewReloading.alpha = 1
                self.lblErrorDesc.alpha = 1
                self.lblErrorDesc.text = error
            } else {
                self.hideError()
                self.lblErrorDesc.alpha = 0
                self.lblErrorDesc.text = ""
                self.SetupProfile((response!.instructorProfile)!)
                self.teacherMethodsSlides = response?.instructorProfile?.teachingMethod ?? []
                self.teacherAreasSlides = response?.instructorProfile?.coveredArea ?? []
                self.teacherCategoriesSlides = response?.instructorProfile?.teacherCategory ?? []
                self.collectionViewMehtods.reloadData()
                self.collectionViewAreas.reloadData()
                self.collectionViewCategoryy.reloadData()
                /*
                 if self.teacherMethodsSlides.isEmpty && self.teacherAreasSlides.isEmpty && self.teacherCategoriesSlides.isEmpty {
                     self.collectionViewMehtods.isHidden = true
                     self.lblTeachingMethods.text = ""
                     self.collectionViewAreas.isHidden = true
                     self.lblCoveredArea.text = ""
                     self.collectionViewCategoryy.isHidden = true
                     self.lblCategories.text = ""
                 }
                 */
                print((response?.instructorProfile?.email)!)
                print(response?.message ?? "")
            }
        }
    }
    
    func SetupProfile(_ profileData: HomeMostViewedModel){
        
        lblEmail.text = profileData.email
        lblTeacherName.text = profileData.name
        lblDescriptionText.text = profileData.description
        lblTeacherWhatsApp.text = profileData.whatsApp
        lblTeacherFacebookAccount.text = profileData.facebook
        lblDescriptionJobName.text = profileData.type
        
        if let url = URL(string: profileData.image){
            imgViewTeacher.kf.setImage(with: url)
            imgViewTeacher.roundedImage()
        }else {
            imgViewTeacher.image = UIImage.init(named:  "TeacherImage")
            imgViewTeacher.roundedImage()
            
        }
    }
}
