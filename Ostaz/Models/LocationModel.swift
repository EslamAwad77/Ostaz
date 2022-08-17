//
//  LocationModel.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 17/08/2022.
//

import Foundation


struct LocationModel{
    var id: Int = 0
    var name: String = ""
    var city: String = ""
    var country: String = ""
    
    init(){}
    
    init(apiData: [String: Any]?){
        self.id = apiData?["id"] as? Int ?? 0
        self.name = apiData?["name"] as? String ?? ""
        self.city = apiData?["city"] as? String ?? ""
        self.country = apiData?["country"] as? String ?? ""
    }
}

struct LocationResponse{
    var message: String?
    var locations: [LocationModel]?
}
