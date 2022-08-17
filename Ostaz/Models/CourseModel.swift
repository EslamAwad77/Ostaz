//
//  CourseModel.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 07/08/2022.
//

import Foundation

struct CourseModel{
 
    var id: Int = 0
    var courseName: String = ""
    var price: String = ""
    var duration: String = ""
    var date: String = ""
    var image: String = ""
    var catName: String = ""
    
    init(){}
    
    init(apiData: [String: Any]?){
        
        self.id = apiData?["id"] as? Int ?? 0
        self.courseName = apiData?["name"] as? String ?? ""
        self.price = apiData?["price"] as? String ?? ""
        self.duration = apiData?["duration"] as? String ?? ""
        self.date = apiData?["start_date"] as? String ?? ""
        self.image = apiData?["image"] as? String ?? ""
        self.catName = apiData?["category_name"] as? String ?? ""
    }
}


struct CourseResponse{
    var message: String?
    var courses: [CategoryModel]?
}
