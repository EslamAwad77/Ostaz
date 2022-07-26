//
//  HomePaidInstCollectionViewCell.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 25/07/2022.
//

import UIKit
import Kingfisher

class HomePaidInstCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var viewRoundedPiad: UIView!

    @IBOutlet weak var imgViewInstCategory: UIImageView!
    @IBOutlet weak var imgViewTeacher: UIImageView!
    @IBOutlet weak var lblTeacherName: UILabel!
    @IBOutlet weak var lblTeacherJob: UILabel!
    
    
    static let identifier = String(describing: HomePaidInstCollectionViewCell.self)
    
    func setupUI(_ slide: HomePaidInstructorsModel){
        lblTeacherName.text = slide.name
        
        if (slide.teacherCategory.isEmpty && slide.teacherCategory.count == 0){
            lblTeacherJob.text = "no teacher job"
            imgViewInstCategory.image = UIImage.init(named:  "FailGoToTeacherImage")
            imgViewInstCategory.roundedImage()

        } else {
            lblTeacherJob.text = slide.teacherCategory[0].categoryName
            imgViewInstCategory.kf.indicatorType = .activity

            if let url = URL(string: slide.teacherCategory[0].categoryImage){
                imgViewInstCategory.kf.setImage(with: url)
                imgViewInstCategory.roundedImage()
            }else {
                imgViewInstCategory.image = UIImage.init(named:  "FailGoToTeacherImage")
                imgViewInstCategory.roundedImage()
            }
        }


        imgViewTeacher.kf.indicatorType = .activity
        if let url = URL(string: slide.image){
            imgViewTeacher.kf.setImage(with: url)
            imgViewTeacher.roundedImage()
        }else {
            imgViewTeacher.image = UIImage.init(named:  "FailGoToTeacherImage")
            imgViewTeacher.roundedImage()
        }
    
    }
}
