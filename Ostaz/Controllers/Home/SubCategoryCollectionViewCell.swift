//
//  SubCategoryCollectionViewCell.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 17/07/2022.
//

import UIKit

class SubCategoryCollectionViewCell: UICollectionViewCell {
   
    //-------------------IBOutlet------------------------
    @IBOutlet weak var imgViewSubCategory: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    
    //-------------------Variables------------------------

    static let identifier = String(describing: SubCategoryCollectionViewCell.self)
    
    //-------------------Functions------------------------
    
    func setupUI(_ subCategoriesSlide: CollectionViewCategorySlide){
        imgViewSubCategory.image = subCategoriesSlide.categoryImage
        lblDescription.text = subCategoriesSlide.categoryName
        
    }
}
