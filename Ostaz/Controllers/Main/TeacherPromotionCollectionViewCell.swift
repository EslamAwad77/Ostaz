//
//  TeacherPromotionCollectionViewCell.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 21/06/2022.
//

import UIKit

class TeacherPromotionCollectionViewCell: UICollectionViewCell {
    
    //-------------------variables----------------------
    var didDeleted: (() -> ())?
    static let identifier = String(describing: TeacherPromotionCollectionViewCell.self)
    
    //-------------------IBOutlet------------------------
    
    @IBOutlet weak var btnCheckBox: UIButton!
    @IBOutlet weak var lblInsertTeachMethod: UILabel!
    
    @IBOutlet weak var lblSelectedArea: UILabel!
    @IBOutlet weak var btnDeleteSelectedArea: UIButton!
    
    
    @IBOutlet weak var lblInsertCategory: UILabel!
    
    //-------------------Actions------------------------
    @IBAction func btnCheckBoxTapped(_ sender: UIButton) {
        self.teachMethod?.isActive = !(self.teachMethod?.isActive ?? false)
        updateTeachMethod()
    }
    
    @IBAction func btnDeleteCellTapped(_ sender: UIButton) {
        didDeleted?()
    }
    
    //-------------------Functions------------------------
    
    
    
    var teachMethod: TeachMethodModel? {
        didSet {
            lblInsertTeachMethod.text = teachMethod?.name
            updateTeachMethod()
        }
    }
    
    func updateTeachMethod() {
        if teachMethod?.isActive == true {
            btnCheckBox.setImage(UIImage(named: "checkBoxMark"), for: .normal)
        } else {
            btnCheckBox.setImage(UIImage(named: "checkBoxMarknotselected"), for: .normal)
        }
    }
    
    var teacherArea: AreaModel? {
        didSet{
            lblSelectedArea.text = teacherArea?.name
        }
    }
    
//    func updateSelectedArea(){
//        if teacherArea?.isDeleted == true {
//
//        }
//
//    }
    
    var teacherCategory: TeacherCategoryModel? {
        didSet{
            lblInsertCategory.text = teacherCategory?.categoryName
        }
    }
    
//    func UpdateSelectedCategory(){
//        if teacherCategory?.isDeleted == true{
//            
//        }
//    }
}
