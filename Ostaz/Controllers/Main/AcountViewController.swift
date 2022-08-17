//
//  AcountViewController.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 14/06/2022.

import UIKit

class AcountViewController: UIViewController {
    
    var email: String = ""
    var image: String = ""
    
    var getLocations = [LocationModel]()
    
    //var updateProfile: [ProfileModel] = []
    //-------------------IBOutlet------------------------
    @IBOutlet weak var AccountCustomView: AccountCustomView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
    //-------------------Actions------------------------
    @IBAction func btnBackToMoreVC(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func btnGoToPasswordVC(_ sender: UIButton) {
        self.goToEditPass()
    }
    
    @IBAction func btnGoToLocationVC(_ sender: UIButton) {
        self.goToLocation()
    }
    
    @IBAction func btnPromotionForTeacherVC(_ sender: UIButton) {
        self.goToPromotion()
    }
    
    @IBAction func btnEditAccount(_ sender: UIButton) {
        APIProfile.fetchingUpdateProfile(email: email, image: image) { error, response in
            if error != nil{
                print(error!)
            }else{
                //self.updateProfile = response?.profile ?? []
                print(response!)
                print(response?.message ?? "")
                self.goToPromotion()
            }
            
        }
    }
    
    //-------------------LifeCycle of screen------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    func goToPromotion(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let promotionForTeacherVC = storyBoard.instantiateViewController(withIdentifier: "PromotionForTeacherVC") as! PromotionForTeacherVC
        promotionForTeacherVC.modalPresentationStyle = .fullScreen
        self.present(promotionForTeacherVC, animated: true)
    }
    
    
    func goToLocation(){
        let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
        let locationVC = storyBoard.instantiateViewController(withIdentifier: "LocationViewController") as! LocationViewController
        locationVC.modalPresentationStyle = .fullScreen
        self.present(locationVC, animated: true)
    }
    
    func goToEditPass(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let editPasswordVC = storyBoard.instantiateViewController(withIdentifier: "EditPasswordViewController") as! EditPasswordViewController
        editPasswordVC.modalPresentationStyle = .fullScreen
        self.present(editPasswordVC, animated: true)
    }
}
