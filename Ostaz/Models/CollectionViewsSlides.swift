//
//  CollectionViewSlide.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 12/06/2022.
//


import UIKit

struct CollectionViewHomeMostViewedSlide {
    let teacherName: String
    let teacherJob: String
    let descriptionImage: UIImage
    let teacherImage: UIImage
}

struct CollectionViewCategorySlide {
   
    var categoryId: Int = 0
    var categoryImage: String = ""
    var categoryName: String = ""
    
    init() {}
    
    init(apiModel: [String: Any]?) {
        self.categoryId = (apiModel?["id"] as? Int) ?? 0
        self.categoryName = (apiModel?["category_name"] as? String) ?? ""
        self.categoryImage = (apiModel?["category_image"] as? String) ?? ""
    }
    
}

struct CollectionViewMethodsSlide{
    let methodName: String
    let methodImage: UIImage
}



struct CollectionViewAreasSlide{
    let areaName: String
    let areaImage: UIImage
}


struct CollectionViewTeahcerCategoriesSlide{
    let categoryName: String
    let categoryImage: UIImage
}
