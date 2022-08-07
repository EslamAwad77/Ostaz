//
//  CourseViewCell.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 07/08/2022.
//

import UIKit

class CourseViewCell: UITableViewCell {

    var didClickAttendance: (()->())?
    var didClickListOfStudents: (()->())?

    @IBOutlet weak var imgViewCategory: UIImageView!
    @IBOutlet weak var lblCategoryAndSubCategory: UILabel!
    @IBOutlet weak var lblCourceName: UILabel!
    
    
    @IBAction func btnAttendancePressed(_ sender: UIButton) {
        didClickAttendance?()
    }
    
    @IBAction func btnListOfStudentsPressed(_ sender: UIButton) {
        didClickListOfStudents?()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
