//
//  HomeCategoryModel.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 24/07/2022.
//

import Foundation

struct HomeCategoryModel{
    var categoryId: Int = 0
    var categoryImage: String = ""
    var categoryName: String = ""
    
    init() {}
    
    init(apiModel: [String: Any]?) {
        self.categoryId = (apiModel?["id"] as? Int) ?? 0
        //self.categoryName = (apiModel?["name"] as? String) ?? ""
        
        if self.categoryName == "" {
            self.categoryName = ""
            
        } else {
            self.categoryName = (apiModel?["name"] as? String) ?? ""
        }
        
        self.categoryImage = (apiModel?["image"] as? String) ?? ""
    }
}
