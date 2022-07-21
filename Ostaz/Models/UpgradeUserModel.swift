//
//  UpgradeUserModel.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 21/07/2022.
//

import Foundation

struct UpgradeUserModel {
    var phone: String = ""
    var area1: String = ""
    var area2: String = ""
    var subSpecialize1: String = ""
    var subSpecialize2: String = ""
    var email: String = ""
    
    init(){}
    
    init(apiModel: [String: Any]?){
        self.phone = apiModel?["phone"] as? String ?? ""
        self.area1 = apiModel?["area[1]"] as? String ?? ""
        self.area2 = apiModel?["area[2]"] as? String ?? ""
        self.subSpecialize1 = apiModel?["subspecializations[1]"] as? String ?? ""
        self.subSpecialize2 = apiModel?["subspecializations[2]"] as? String ?? ""
    }
}
