//
//  APICategory.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 17/07/2022.
//

import UIKit
import Alamofire
import SwiftyJSON

class APICategory: NSObject {

    
    static func fetchingCategory(completion: @escaping (_ error :String?, _ response: CategoryResponse?) -> Void){
        let url = URLs.category
        let token = UserDefaults.standard.value(forKey: "token") as? String
        let bearerToken =  token != nil ? "Bearer \(token!)" : ""    // ternary Operator
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["Authorization": bearerToken])
            .response { response in
                if (response.response?.statusCode ?? 0) >= 200 && (response.response?.statusCode ?? 0) <= 299{
                    let json = JSON(response.data!)
                    print(json)
                    var result = CategoryResponse()
                    result.message = json["message"].string
                    completion(nil, result)
                } else {
                    let json = JSON(response.data!)
                    print(json)
                    let message = json["message"].string
                    completion(message, nil)
                }
            }
    }
    
    static func fetchingSubCategory(completion: @escaping (_ error :String?, _ response: SubCategoryResponse?) -> Void){
        let url = URLs.subCategory
        let token = UserDefaults.standard.value(forKey: "token") as? String
        let bearerToken =  token != nil ? "Bearer \(token!)" : ""    // ternary Operator
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["Authorization": bearerToken])
            .response { response in
                if (response.response?.statusCode ?? 0) >= 200 && (response.response?.statusCode ?? 0) <= 299{
                    let json = JSON(response.data!)
                    print(json)
                    var result = SubCategoryResponse()
                    result.message = json["message"].string
                    completion(nil, result)
                } else {
                    let json = JSON(response.data!)
                    print(json)
                    let message = json["message"].string
                    completion(message, nil)
                }
            }
    }
    
    static func fetchingInstOfSubCategory(completion: @escaping (_ error :String?, _ response: InstOfSubCategoryResponse?) -> Void){
        let url = URLs.instructorOfSubCategory
        let token = UserDefaults.standard.value(forKey: "token") as? String
        let bearerToken =  token != nil ? "Bearer \(token!)" : ""    // ternary Operator
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["Authorization": bearerToken])
            .response { response in
                if (response.response?.statusCode ?? 0) >= 200 && (response.response?.statusCode ?? 0) <= 299{
                    let json = JSON(response.data!)
                    print(json)
                    var result = InstOfSubCategoryResponse()
                    result.message = json["message"].string
                    completion(nil, result)
                } else {
                    let json = JSON(response.data!)
                    print(json)
                    let message = json["message"].string
                    completion(message, nil)
                }
            }
    }
}
