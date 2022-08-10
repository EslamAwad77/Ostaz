//
//  TeacherProfileCollectionViewCell.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 21/06/2022.
//

import UIKit

class TeacherProfileCollectionViewCell: UICollectionViewCell {
    
    //-------------------IBOutlet------------------------
    
    @IBOutlet weak var imgViewRightMark: UIImageView!
    @IBOutlet weak var lblTeachingMethod: UILabel!
    
    @IBOutlet weak var imgViewLocationMark: UIImageView!
    @IBOutlet weak var lblCoveredArea: UILabel!
    
    @IBOutlet weak var imgViewCategoryMark: UIImageView!
    @IBOutlet weak var lblCategory: UILabel!
    
    
    //-------------------Variables------------------------

    static let identifier = String(describing: TeacherProfileCollectionViewCell.self)

    //-------------------Functions------------------------

    func setupUIMehtods(_ methodsSlide: MethodModel){
        lblTeachingMethod.text = methodsSlide.name
        imgViewRightMark.image = UIImage(named: "RightMark")
    }
    
   
    
    func setupUIAreas(_ areasSlide: AreaModel){
        lblCoveredArea.text = areasSlide.name
        imgViewLocationMark.image = UIImage(named: "locationMark")
    }
    
   
    
    func setupUICategories(_ categoriesSlide: HomeCategoryModel){
        lblCategory.text = categoriesSlide.categoryName
        imgViewCategoryMark.image = UIImage(named: "tagesMark")
    }
    
   
}
