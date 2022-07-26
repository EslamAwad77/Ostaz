//
//  WishListModel.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 26/07/2022.
//

import Foundation

struct WishListModel{
    var id: Int = 0
    var name: String = ""
    var email: String = ""
    var whatsApp: String = ""
    var phone: String = ""
    var type: String = ""
    var description: String = ""
    var views: Int = 0
    var image : String = ""
    var isFavourite: Bool = false
    var locations: Bool = false
    var teachingMethod: String = ""
    var teacherCategory: [HomeCategoryModel] = []
    //var services: [String] = []
    var facebook: String = ""
    //var cources: [String] = []
    
    init(){}
    
    init(apiData: [String: Any]?){
        
        self.id = (apiData?["id"] as? Int) ?? 0
        self.name = (apiData?["name"] as? String) ?? ""
        self.email = (apiData?["email"] as? String) ?? ""
        self.whatsApp = (apiData?["whatsApp"] as? String) ?? ""
        self.phone = (apiData?["phone"] as? String) ?? ""
        self.type = (apiData?["type"] as? String) ?? ""
        self.description = (apiData?["description"] as? String) ?? ""
        self.views = (apiData?["views"] as? Int) ?? 0
        self.image = (apiData?["image"] as? String) ?? ""
        self.isFavourite = (apiData?["is_favourite"] as? Bool) ?? false
        self.locations = (apiData?["locations"] as? Bool) ?? false
        self.teachingMethod = (apiData?["teaching_method"] as? String) ?? ""
        //self.teacherCategory = (apiData?["categories"] as? [HomeCategoryModel]) ?? []
        print("=========categories\n",(apiData?["categories"] as? AnyObject) as? NSArray )

        if let teachCategories = (apiData?["categories"] as? AnyObject) as? NSArray{
                print("============", apiData?["categories"])
                    for cat in teachCategories{

                        self.teacherCategory.append(HomeCategoryModel(apiModel: cat as! [String : Any]))

                    }
                }
        print("=========\n",teacherCategory)
        self.facebook = (apiData?["facebook"] as? String) ?? ""
    }
}
