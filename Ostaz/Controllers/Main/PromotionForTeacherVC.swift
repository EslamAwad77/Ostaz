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
    let categoryValues: [String] = ["Teaching", "Math", "Grade 6"]
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
    
    //-------------------functions------------------------
    func setUpUI(){
        let m1 = TeachMethodModel()
        m1.name = "test"
        let m2 = TeachMethodModel()
        m2.name = "test2"
        let m3 = TeachMethodModel()
        m3.name = "test3"
        let m4 = TeachMethodModel()
        m3.name = "test4"
        let m5 = TeachMethodModel()
        m3.name = "test5"
        teacherMethodItems = [m1, m2, m3, m4, m5]
        
        let a1 = AreaModel()
        a1.name = "Egypt"
        let a2 = AreaModel()
        a2.name = "Mansoura"
        let a3 = AreaModel()
        a3.name = "samia Elgamal"
        TeacherAreaItems = [a1, a2, a3]
        var areas: [String] = []
        for item in TeacherAreaItems {
            areas.append(item.name ?? "")
        }
        
        let c1 = TeacherCategoryModel()
        c1.categoryName = "category1"
        let c2 = TeacherCategoryModel()
        c2.categoryName = "cat2"
        let c3 = TeacherCategoryModel()
        c3.categoryName = "cate3"
        TeachercategoryItems = [c1, c2, c3]
        var categories: [String] = []
        for item in TeachercategoryItems{
            categories.append(item.categoryName ?? "")
        }
        
        
        
        areaDropDown.dataSource = areas
        areaDropDown.anchorView = viewAreaDropDowm
        categoryDropDown.anchorView = viewCategoryDropDown
        categoryDropDown.dataSource = categoryValues
        areaDropDown.bottomOffset = CGPoint(x: 0, y:(areaDropDown.anchorView?.plainView.bounds.height)!)
        areaDropDown.topOffset = CGPoint(x: 0, y:-(categoryDropDown.anchorView?.plainView.bounds.height)!)
        categoryDropDown.bottomOffset = CGPoint(x: 0, y:(areaDropDown.anchorView?.plainView.bounds.height)!)
        categoryDropDown.topOffset = CGPoint(x: 0, y:-(areaDropDown.anchorView?.plainView.bounds.height)!)
        areaDropDown.direction = .any
        categoryDropDown.direction = .any
        areaDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.selectedAreas.append(self.TeacherAreaItems[index])
            self.collectionViewAddingAreas.reloadData()
        }
        categoryDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.selectedCategories.append(self.TeachercategoryItems[index])
            self.collectionViewAddingCategories.reloadData()
        }
        
        collectionViewTeachMethods.delegate = self
        collectionViewTeachMethods.dataSource = self
        collectionViewAddingAreas.delegate = self
        collectionViewAddingAreas.dataSource = self
        collectionViewAddingCategories.delegate = self
        collectionViewAddingCategories.dataSource = self
        //collectionViewHome.collectionViewLayout = UICollectionViewFlowLayout()
   
    }
}

//-------------------exstensions------------------------
extension PromotionForTeacherVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewTeachMethods{
            return teacherMethodItems.count
        } else if collectionView == self.collectionViewAddingAreas {
            return selectedAreas.count
        }
        return TeachercategoryItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionViewTeachMethods{
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier:TeacherPromotionCollectionViewCell.identifier, for: indexPath) as! TeacherPromotionCollectionViewCell
            cell1.teachMethod = teacherMethodItems[indexPath.row]
            return cell1
        } else if collectionView == self.collectionViewAddingAreas{
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier:TeacherPromotionCollectionViewCell.identifier, for: indexPath) as! TeacherPromotionCollectionViewCell
            
                cell2.teacherArea = selectedAreas[indexPath.row]
            cell2.didDeleted = { [weak self] in
                guard let self  = self else {return }
                self.selectedAreas.removeAll { item in
                    if item.name == cell2.teacherArea?.name {
                        return true
                    }
                    return false
                }
                self.collectionViewAddingAreas.reloadData()
            }
            return cell2
        } else{
            let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: TeacherPromotionCollectionViewCell.identifier, for: indexPath) as! TeacherPromotionCollectionViewCell
            cell3.teacherCategory = TeachercategoryItems[indexPath.row]
            cell3.didDeleted = { [weak self] in
                guard let self  = self else {return }
                self.selectedCategories.removeAll { item in
                    if item.categoryName == cell3.teacherCategory?.categoryName {
                        return true
                    }
                    return false
                }
                self.collectionViewAddingCategories.reloadData()
            }
            return cell3
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionViewTeachMethods{
            return CGSize(width: collectionView.frame.width/2.5, height: 38)
        } else if collectionView == self.collectionViewAddingAreas{
            return CGSize(width: collectionView.frame.width*0.315, height: 33)
        } else{
            return CGSize(width: collectionView.frame.width*0.315, height: 33)
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
}
