//
//  HomeFilterCollViewCell.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 07/08/2022.
//

import UIKit

class HomeFilterCollViewCell: UICollectionViewCell {
    
    //-------------------variables----------------------
    var didDeleted: (() -> ())?
    static let identifier = String(describing: HomeFilterCollViewCell.self)
    
    var userCategory: CollectionViewCategorySlide? {
        didSet{
            lblSelectedCategory.text = userCategory?.categoryName
        }
    }
    var userCity: CityModel? {
        didSet{
            lblSelectedCity.text = userCity?.name
        }
    }
    var userArea: AreaModel? {
        didSet{
            lblSelectedArea.text = userArea?.name
        }
    }
    
    //-------------------IBOutlet----------------------
    @IBOutlet weak var lblSelectedCategory: UILabel!
    @IBOutlet weak var lblSelectedCity: UILabel!
    @IBOutlet weak var lblSelectedArea: UILabel!
    
    //-------------------Actions----------------------
    @IBAction func btnDeletePressed(_ sender: UIButton) {
        didDeleted?()
    }
    
    
}
