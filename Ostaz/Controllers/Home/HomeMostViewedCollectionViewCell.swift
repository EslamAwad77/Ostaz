//
//  HomeCollectionViewCell.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 12/06/2022.
//

import UIKit
import Kingfisher

class HomeMostViewedCollectionViewCell: UICollectionViewCell {
    
    //-------------------IBOutlet------------------------
    @IBOutlet weak var slideImgViewDescription: UIImageView!
    @IBOutlet weak var slideImgViewTeacher: UIImageView!
    @IBOutlet weak var lblTeacherName: UILabel!
    @IBOutlet weak var lblTeacherJob: UILabel!
    
    //-------------------Variables------------------------
    
    static let identifier = String(describing: HomeMostViewedCollectionViewCell.self)
    
    //-------------------Functions------------------------
    
    func setup(_ slide: HomeMostViewedModel){
        
        lblTeacherName.text = slide.name
        if (slide.teacherCategory.isEmpty){
            print("error")
        } else {
            lblTeacherJob.text = slide.teacherCategory[0].categoryName
            slideImgViewDescription.kf.indicatorType = .activity
            
            if let url = URL(string: slide.teacherCategory[0].categoryImage){
                slideImgViewDescription.kf.setImage(with: url)
            }else {
                slideImgViewDescription.image = UIImage.init(named:  "FailGoToTeacherImage")
            }
        }
        
        
        slideImgViewTeacher.kf.indicatorType = .activity
        if let url = URL(string: slide.image){
            slideImgViewTeacher.kf.setImage(with: url)
        }else {
            slideImgViewTeacher.image = UIImage.init(named:  "FailGoToTeacherImage")
        }
        
        
    }
}



