//
//  WishListCell.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 14/06/2022.
//

import UIKit

class WishListCell: UITableViewCell {

    @IBOutlet weak var viewWishList: UIView!
    @IBOutlet weak var imgViewDecription: UIImageView!
    @IBOutlet weak var imgViewTeacher: UIImageView!
    @IBOutlet weak var lblTeacherName: UILabel!
    @IBOutlet weak var lblTeacherJob: UILabel!
    @IBOutlet weak var btnAddToWishList: UIButton!
    
    
    @IBAction func btnWishListPressed(_ sender: UIButton) {
       
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}
