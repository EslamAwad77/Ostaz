//
//  HomePiadInstCollViewCell.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 24/07/2022.
//

import UIKit

class HomePiadInstCollViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideImgViewDescription: UIImageView!
    @IBOutlet weak var slideImgViewTeacher: UIImageView!
    @IBOutlet weak var lblTeacherName: UILabel!
    @IBOutlet weak var lblTeacherJob: UILabel!
    
    //-------------------Variables------------------------
    
    static let identifier = String(describing: HomePiadInstCollViewCell.self)
    
    //-------------------Functions------------------------
    
    func setup(_ slide: HomePaidInstructorsModel){
        
        lblTeacherName.text = slide.name
        lblTeacherJob.text = slide.teacherCategory[0].categoryName
        
        slideImgViewDescription.kf.indicatorType = .activity
        
        if let url = URL(string: slide.image){
            slideImgViewDescription.kf.setImage(with: url)
        }else {
            slideImgViewDescription.image = UIImage.init(named:  "FailGoToTeacherImage")
        }
        
        slideImgViewTeacher.kf.indicatorType = .activity
        
        if let url = URL(string: slide.teacherCategory[0].categoryImage){
            slideImgViewTeacher.kf.setImage(with: url)
        }else {
            slideImgViewTeacher.image = UIImage.init(named:  "FailGoToTeacherImage")
        }
    }
}
