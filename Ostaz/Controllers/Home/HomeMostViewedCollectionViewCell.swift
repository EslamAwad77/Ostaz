//
//  HomeCollectionViewCell.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 12/06/2022.
//

import UIKit

class HomeMostViewedCollectionViewCell: UICollectionViewCell {
    
    
    
    //-------------------IBOutlet------------------------
    
    @IBOutlet weak var slideImgViewDescription: UIImageView!
    @IBOutlet weak var slideImgViewTeacher: UIImageView!
    @IBOutlet weak var lblTeacherName: UILabel!
    @IBOutlet weak var lblTeacherJob: UILabel!
    
    //-------------------Variables------------------------
    
    static let identifier = String(describing: HomeMostViewedCollectionViewCell.self)
    
    //-------------------Functions------------------------
    
    func setup(_ slide: CollectionViewHomeMostViewedSlide){
        
        slideImgViewDescription.image = slide.descriptionImage
        slideImgViewTeacher.image = slide.teacherImage
        lblTeacherName.text = slide.teacherName
        lblTeacherJob.text = slide.teacherJob
    }
}
 
