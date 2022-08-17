//
//  CollectionViewSlide.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 12/06/2022.
//


import UIKit


struct CategoryModel {
   
    var categoryId: Int = 0
    var categoryImage: String = ""
    var categoryName: String = ""
    
    init() {}
    
    init(apiModel: [String: Any]?) {
        self.categoryId = (apiModel?["id"] as? Int) ?? 0
        self.categoryName = (apiModel?["name"] as? String) ?? ""
        self.categoryImage = (apiModel?["image"] as? String) ?? ""
    }
}

