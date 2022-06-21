//
//  PromotionForTeacherVC.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 21/06/2022.
//

import UIKit

class PromotionForTeacherVC: UIViewController {
    
    //-------------------Variables------------------------
    
    var TeacherMethodSlides: [CollectionViewPromotionMethodsSlide] = []
    var TeacherAreaSlides: [CollectionViewPromotionAreasSlide] = []
    var TeachercategorySlides: [CollectionViewPromotionCategoriesSlide] = []
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
        //let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        //let vc = storyBoard.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        //vc.modalPresentationStyle = .fullScreen
        //self.present(vc, animated: true)
    }
    @IBAction func btnAddOtherMethod(_ sender: UIButton) {
    }
    @IBAction func btnDropDownSelectArea(_ sender: UIButton) {
    }
    @IBAction func btnDropDownSelectCategory(_ sender: UIButton) {
    }
    @IBAction func btnConfirmPromotion(_ sender: UIButton) {
    }
    //-------------------lifecycle------------------------

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()

    }
    
    //-------------------functions------------------------
    func setUpUI(){
        collectionViewTeachMethods.delegate = self
        collectionViewTeachMethods.dataSource = self
        collectionViewAddingAreas.delegate = self
        collectionViewAddingAreas.dataSource = self
        collectionViewAddingCategories.delegate = self
        collectionViewAddingCategories.dataSource = self
        //collectionViewHome.collectionViewLayout = UICollectionViewFlowLayout()
        TeacherMethodSlides = [
            CollectionViewPromotionMethodsSlide(methodImage: #imageLiteral(resourceName: "checkBoxMarknotselected"), methodName: "Online"),
            CollectionViewPromotionMethodsSlide(methodImage: #imageLiteral(resourceName: "checkBoxMarknotselected"), methodName: "Student Home"),
            CollectionViewPromotionMethodsSlide(methodImage: #imageLiteral(resourceName: "checkBoxMarknotselected"), methodName: "Teacher Place"),
            CollectionViewPromotionMethodsSlide(methodImage: #imageLiteral(resourceName: "checkBoxMarknotselected"), methodName: "Center"),
            CollectionViewPromotionMethodsSlide(methodImage: #imageLiteral(resourceName: "checkBoxMarknotselected"), methodName: "Groups")
        ]
        TeacherAreaSlides = [
            CollectionViewPromotionAreasSlide(areaName: "Egypt"),
            CollectionViewPromotionAreasSlide(areaName: "Dakahlia"),
            CollectionViewPromotionAreasSlide(areaName: "Mansoura")
            
        ]
        TeachercategorySlides = [

            CollectionViewPromotionCategoriesSlide(categoryName: "Teaching"),
            CollectionViewPromotionCategoriesSlide(categoryName: "Math"),
            CollectionViewPromotionCategoriesSlide(categoryName: "Grade 6")
        ]
    }
}
//-------------------exstensions------------------------
extension PromotionForTeacherVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewTeachMethods{
            return TeacherMethodSlides.count
        } else if collectionView == self.collectionViewAddingAreas {
            return TeacherAreaSlides.count
        }
        return TeachercategorySlides.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionViewTeachMethods{
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: TeacherPromotionCollectionViewCell.identifier, for: indexPath) as! TeacherPromotionCollectionViewCell
            cell1.setUPUIMethods(TeacherMethodSlides[indexPath.row])
            return cell1
        } else if collectionView == self.collectionViewAddingAreas{
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: TeacherPromotionCollectionViewCell.identifier, for: indexPath) as! TeacherPromotionCollectionViewCell
            cell2.setUPUIAreas(TeacherAreaSlides[indexPath.row])
            return cell2
        } else{
            let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: TeacherPromotionCollectionViewCell.identifier, for: indexPath) as! TeacherPromotionCollectionViewCell
            cell3.setUPUICategories(TeachercategorySlides[indexPath.row])
            return cell3
        }

    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionViewTeachMethods{
            //let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            //let vc = storyBoard.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
            //vc.modalPresentationStyle = .fullScreen
            //self.present(vc, animated: true)
        } else if collectionView == self.collectionViewAddingAreas {
            //let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            //let vc = storyBoard.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
            //vc.modalPresentationStyle = .fullScreen
            //self.present(vc, animated: true)
        } else {
            //let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            //let vc = storyBoard.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
            //vc.modalPresentationStyle = .fullScreen
            //self.present(vc, animated: true)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionViewTeachMethods{
            return CGSize(width: collectionView.frame.width/2.5, height: 38)
        } else if collectionView == self.collectionViewAddingAreas{
            return CGSize(width: collectionView.frame.width/3.5, height: 33)
        } else{
            return CGSize(width: collectionView.frame.width/3.5, height: 33)
        }
    }
}
