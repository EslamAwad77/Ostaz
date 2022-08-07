//
//  StudentCoursesViewCell.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 07/08/2022.
//

import UIKit

class StudentCoursesViewCell: UITableViewCell {

    @IBOutlet weak var imgViewCategory: UIImageView!
    @IBOutlet weak var lblCourseName: UILabel!
    @IBOutlet weak var lblCategoryName: UILabel!
    @IBOutlet weak var lblCourseDate: UILabel!
    @IBOutlet weak var lblCourseDuration: UILabel!
    @IBOutlet weak var lblCoursePrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
