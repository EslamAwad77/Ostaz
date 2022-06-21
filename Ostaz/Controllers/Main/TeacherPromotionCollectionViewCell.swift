//
//  TeacherPromotionCollectionViewCell.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 21/06/2022.
//

import UIKit

class TeacherPromotionCollectionViewCell: UICollectionViewCell {
  
        //-------------------IBOutlet------------------------
        
        @IBOutlet weak var imgCheckMarkNotSelected: UIImageView!
        @IBOutlet weak var lblInsertTeachMethod: UILabel!
        
        @IBOutlet weak var lblSelectedArea: UILabel!
        @IBOutlet weak var btnDeleteSelectedArea: UIButton!
        
        
        @IBOutlet weak var lblInsertCategory: UILabel!
        //-------------------Actions------------------------
        
        @IBAction func btnDeleteSelectedAreaPressed(_ sender: UIButton) {
        }
        
        //-------------------Variables------------------------

        static let identifier = String(describing: TeacherPromotionCollectionViewCell.self)

        //-------------------Functions------------------------

       
        
        func setUPUIMethods(_ methodSlide: CollectionViewPromotionMethodsSlide){
            imgCheckMarkNotSelected.image = methodSlide.methodImage
            lblInsertTeachMethod.text = methodSlide.methodName
        }
        
        
        
        func setUPUIAreas(_ areaSlide: CollectionViewPromotionAreasSlide){
            lblSelectedArea.text = areaSlide.areaName
        }
        
       
        
        func setUPUICategories(_ categorieSlide: CollectionViewPromotionCategoriesSlide){
            lblInsertCategory.text = categorieSlide.categoryName
        }
    

}
