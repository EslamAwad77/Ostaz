//
//  LocationCollViewCell.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 19/07/2022.
//

import UIKit

class LocationCollViewCell: UICollectionViewCell {
    
    //-------------------variables----------------------
    var didDeleted: (() -> ())?
    static let identifier = String(describing: LocationCollViewCell.self)
    
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
    
    @IBOutlet weak var lblSelectedCity: UILabel!
    @IBOutlet weak var lblSelectedArea: UILabel!
    
    //-------------------IBAction----------------------
    
    @IBAction func btnDeleteLocation(_ sender: UIButton) {
        didDeleted?()
    }
    
    
    
}
