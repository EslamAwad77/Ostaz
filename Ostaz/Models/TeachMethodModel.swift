//
//  TeachMethodModel.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 26/06/2022.
//

import Foundation

class TeachMethodModel{
    var id: Int = 0
    var name: String = ""
    var isActive: Bool = false
    
    init(){}
    
    init(apiData: [String: Any]?){
        self.id = (apiData?["id"] as? Int) ?? 0
        self.name = (apiData?["name"] as? String) ?? ""
    }
}
