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
    @IBOutlet weak var viewRoundedMostViewed: UIView!
    @IBOutlet weak var slideImgViewDescription: UIImageView!
    @IBOutlet weak var slideImgViewTeacher: UIImageView!
    @IBOutlet weak var lblTeacherName: UILabel!
    @IBOutlet weak var lblTeacherJob: UILabel!
    
    //-------------------Variables------------------------
    
    static let identifier = String(describing: HomeMostViewedCollectionViewCell.self)
    
    //-------------------Functions------------------------
    
    func setup(_ slide: UserModel){
        
        lblTeacherName.text = slide.name
        if (slide.teacherCategory.isEmpty && slide.teacherCategory.count == 0) {
            lblTeacherJob.text = "no teacher job"
            slideImgViewDescription.image = UIImage.init(named:  "WishListPic2")
        } else {
            lblTeacherJob.text = slide.teacherCategory[0].categoryName
            slideImgViewDescription.kf.indicatorType = .activity
            
            if let url = URL(string: slide.teacherCategory[0].categoryImage){
                slideImgViewDescription.kf.setImage(with: url)
            }else {
                slideImgViewDescription.image = UIImage.init(named:  "WishListPic2")
            }
        }
        
        
        slideImgViewTeacher.kf.indicatorType = .activity
        if let url = URL(string: slide.image){
            slideImgViewTeacher.kf.setImage(with: url)
            slideImgViewTeacher.roundedImage()
            
        }else {
            slideImgViewTeacher.image = UIImage.init(named:  "TeacherImage")
            slideImgViewTeacher.roundedImage()

        }
        
        
    }
}



