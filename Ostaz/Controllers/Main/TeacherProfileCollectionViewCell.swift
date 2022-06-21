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

    func setupUIMehtods(_ methodsSlide: CollectionViewMethodsSlide){
        lblTeachingMethod.text = methodsSlide.methodName
        imgViewRightMark.image = methodsSlide.methodImage
    }
    
   
    
    func setupUIAreas(_ areasSlide: CollectionViewAreasSlide){
        lblCoveredArea.text = areasSlide.areaName
        imgViewLocationMark.image = areasSlide.areaImage
    }
    
   
    
    func setupUICategories(_ categoriesSlide: CollectionViewTeahcerCategoriesSlide){
        lblCategory.text = categoriesSlide.categoryName
        imgViewCategoryMark.image = categoriesSlide.categoryImage
    }
    
   
}
