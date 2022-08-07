//
//  UserModel.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 26/06/2022.
//

import Foundation
import Alamofire

//must not contain ui
//must not import uikit

struct UserModel {
    var id: Int = 0
    var name: String = ""
    var email: String = ""
    var whatsapp: String = ""
    var phone: String = ""
    var facebook: String = ""
    var type: String = ""
    var description: String = ""
    var image: String = ""
    var views: [String] = []
    var is_favourite: Bool = false
    var location: Bool = false
    var token: String = ""
  
    /*
     var teachingMethod: String = ""
     var coveredArea: [AreaModel] = []
     var teacherCategory: [HomeCategoryModel] = []
     var services: [String] = []
     var cources: [String] = []
     */
    
    init(){}
    
    init(apiData: [String: Any]?) {
        self.id = apiData?["id"] as? Int ?? 0
        self.name = apiData?["name"] as? String ?? ""
        self.email = apiData?["email"] as? String ?? ""
        self.whatsapp = apiData?["whatsapp"] as? String ?? ""
        self.phone = apiData?["phone"] as? String ?? ""
        self.facebook = apiData?["facebook"] as? String ?? ""
        self.type = apiData?["type"] as? String ?? ""
        self.description = apiData?["description"] as? String ?? ""
        self.image = apiData?["image"] as? String ?? ""
        self.views = apiData?["views"] as? [String] ?? []
        self.is_favourite = apiData?["is_favourite"] as? Bool ?? false
        self.location = apiData?["location"] as? Bool ?? false
        self.token = apiData?["token"] as? String ?? ""
        /*
         self.teachingMethod = (apiData?["teaching_method"] as? String) ?? ""
         
         //print("=========coverdArea\n",(apiData?["coverd_area"] as? AnyObject) as? NSArray )
         
         if let coveredArea = (apiData?["coverd_area"] as? AnyObject) as? NSArray{
             // print("============", apiData?["coverd_area"])
             for area in coveredArea{
                 self.coveredArea.append(AreaModel(apiData: area as? [String : Any]))
             }
         }
         //print("=========\n",coveredArea)
         
         //print("=========categories\n",(apiData?["categories"] as? AnyObject) as? NSArray )
         
         if let teachCategories = (apiData?["categories"] as? AnyObject) as? NSArray{
             //print("============", apiData?["categories"])
             for cat in teachCategories{
                 self.teacherCategory.append(HomeCategoryModel(apiModel: cat as? [String : Any]))
             }
         }
         //print("=========\n",teacherCategory)
         
         
         */
    }
}