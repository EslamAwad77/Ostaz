//
//  CategoriesCollectionViewCell.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 19/06/2022.
//

import UIKit
import Kingfisher

class CategoriesCollectionViewCell: UICollectionViewCell {
   
    //-------------------IBOutlet------------------------
    @IBOutlet weak var imgViewCategory: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    
    //-------------------Variables------------------------

    static let identifier = String(describing: CategoriesCollectionViewCell.self)
    
    //-------------------Functions------------------------
    
    func setupUI(_ categoriesSlide: CategoryModel){
        
        imgViewCategory.kf.indicatorType = .activity
        
        if let url = URL(string: categoriesSlide.categoryImage){
            imgViewCategory.kf.setImage(with: url)
        }else {
            imgViewCategory.image = UIImage.init(named:  "FailGoToTeacherImage")
        }
        lblDescription.text = categoriesSlide.categoryName
        
    }
    

}
