//
//  HomeCategoriesCollectionViewCell.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 21/06/2022.
//

import UIKit

class HomeCategoriesCollectionViewCell: UICollectionViewCell {
    
    //-------------------IBOutlet------------------------
  
    @IBOutlet weak var imgViewCategory: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    
    //-------------------Variables------------------------
    
    static let identifier = String(describing: HomeCategoriesCollectionViewCell.self)
    
    //-------------------Functions------------------------
    
    func setupUI(_ categoriesSlide: CollectionViewCategorySlide){

        //imgViewCategory.image = categoriesSlide.categoryImage
        lblDescription.text = categoriesSlide.categoryName

    }
}
