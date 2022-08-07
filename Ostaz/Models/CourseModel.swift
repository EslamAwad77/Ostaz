//
//  CourseModel.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 07/08/2022.
//

import Foundation

struct CourseModel{
 
    var categories: [HomeCategoryModel] = []
    var courseName: String = ""
    
    init(){}
    
    init(apiData: [String: Any]?){
        if let teachCategories = (apiData?["categories"] as? AnyObject) as? NSArray{
            //print("============", apiData?["categories"])
            for cat in teachCategories{
                self.categories.append(HomeCategoryModel(apiModel: cat as! [String : Any]))
            }
        }
        self.courseName = apiData?[""] as? String ?? ""

    }
}
