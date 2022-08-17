//
//  PromotionAreaModel.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 26/06/2022.
//

import Foundation

class AreaModel{
    var id: Int = 0
    var country: String = ""
    var city: String = ""
    var name: String = ""
    var isDeleted: Bool = false
    
    init(){}
    
    init(apiData: [String: Any]?){
        self.id = (apiData?["id"] as? Int) ?? 0
        self.country = (apiData?["country"] as? String) ?? ""
        self.city = (apiData?["city"] as? String) ?? ""
        self.name = (apiData?["name"] as? String) ?? ""
    }
}

struct AreaResponse{
    var message: String?
    var areaValues: [AreaModel]?
}
