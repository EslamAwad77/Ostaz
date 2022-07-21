//
//  PromotionForTeacherVC.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 21/06/2022.
//

import UIKit
import DropDown

class PromotionForTeacherVC: UIViewController {
    
    //-------------------Variables------------------------

    let areaDropDown = DropDown()
    let categoryDropDown = DropDown()
    
    var teacherMethodItems: [TeachMethodModel] = []
    
    var TeacherAreaItems: [AreaModel] = []
    var selectedAreas: [AreaModel] = []
    
    var TeachercategoryItems: [TeacherCategoryModel] = []
    var selectedCategories: [TeacherCategoryModel] = []
   
    //-------------------IBOutlet------------------------

    @IBOutlet weak var imgViewUploadYourImage: UIImageView!
    @IBOutlet weak var imgViewUploadImage: UIImageView!
    @IBOutlet weak var txtFieldWhatsAppNumber: UITextField!
    @IBOutlet weak var txtFieldFaceAccount: UITextField!
    @IBOutlet weak var collectionViewTeachMethods: UICollectionView!
    @IBOutlet weak var collectionViewAddingAreas: UICollectionView!
    @IBOutlet weak var collectionViewAddingCategories: UICollectionView!
    @IBOutlet weak var viewAreaDropDowm: UIView!
    @IBOutlet weak var viewCategoryDropDown: UIView!
    @IBOutlet weak var lblSelectArea: UILabel!
    @IBOutlet weak var lblSelectCategory: UILabel!
    @IBOutlet weak var lblDescriptionTeacherJob: UILabel!
    @IBOutlet weak var txtFieldUploadImgToServer: UITextField!
    @IBOutlet weak var txtFieldMainService: UITextField!
    @IBOutlet weak var txtFieldSeviceCategory: UITextField!
    
    //-------------------Actions------------------------

    @IBAction func BtnBack(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    @IBAction func btnAddOtherMethod(_ sender: UIButton) {
        let vc = UIAlertController.init(title: "Teach Method", message: "please, Add Your Data", preferredStyle: .alert)
        
        vc.addTextField(configurationHandler: nil)
        vc.addAction(UIAlertAction.init(title: "Add", style: .default, handler: { action in
            let textEntered = vc.textFields?.first?.text
            if textEntered != "" {
                let objMethod = TeachMethodModel.init()
                objMethod.name = textEntered ?? ""
                self.teacherMethodItems.append(objMethod)
                self.collectionViewTeachMethods.reloadData()
            } else {
                print("Error , please enter your data")
            }
        }))
        vc.addAction(UIAlertAction.init(title: "cancel", style: .destructive, handler: { action in
        }))
        self.present(vc, animated: true)
    }
    @IBAction func btnDropDownSelectArea(_ sender: UIButton) {
        areaDropDown.show()
    }
    @IBAction func btnDropDownSelectCategory(_ sender: UIButton) {
        categoryDropDown.show()
    }
    @IBAction func btnConfirmPromotion(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    //-------------------lifecycle------------------------

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
    }
    
}
