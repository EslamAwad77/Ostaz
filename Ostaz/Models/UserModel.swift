//
//  UserModel.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 26/06/2022.
//

import Foundation

//must not contain ui
//must not import uikit

struct UserModel {
    var id: Int?
    var name: String?
    var email: String?
    var whatsapp: String?
    var phone: String?
    var facebook: String?
    var type: String?
    var description: String?
    var image: String?
    var categories: [String]?
    var is_favourite: Bool?
    var location: Bool?
    var token: String?
    
    init(){}
    
    init(apiData: [String: Any]?) {
        self.id = apiData?["id"] as? Int
        self.name = apiData?["name"] as? String
        self.email = apiData?["email"] as? String
        self.whatsapp = apiData?["whatsapp"] as? String
        self.phone = apiData?["phone"] as? String
        self.facebook = apiData?["facebook"] as? String
        self.type = apiData?["type"] as? String
        self.description = apiData?["description"] as? String
        self.image = apiData?["image"] as? String
        self.categories = apiData?["categories"] as? [String]
        self.is_favourite = apiData?["is_favourite"] as? Bool
        self.location = apiData?["location"] as? Bool
        self.token = apiData?["token"] as? String
    }
}
