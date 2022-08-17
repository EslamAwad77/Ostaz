//
//  CityModel.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 19/07/2022.
//

import Foundation


class CityModel{
    var id: Int = 0
    var country: String = ""
    var name: String = ""
    var isDeleted: Bool = false
    
    init(){}
    
    init(apiData: [String: Any]?){
        self.id = (apiData?["id"] as? Int) ?? 0
        self.country = (apiData?["country"] as? String) ?? ""
        self.name = (apiData?["name"] as? String) ?? ""
    }
}

struct CityResponse{
    var message: String?
    var cityValues: [CityModel]?
}
