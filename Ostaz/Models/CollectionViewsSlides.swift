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
    var categoryImage: String = ""
    var categoryName: String = ""
    
    init() {}
    
    init(apiModel: [String: Any]?) {
        self.categoryImage = (apiModel?["cat_image"] as? String) ?? ""
        self.categoryName = (apiModel?["Category Name"] as? String) ?? ""
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
