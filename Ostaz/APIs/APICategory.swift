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
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["Authorization": bearerToken, "Accept": "application/json"])
            .response { response in
                if (response.response?.statusCode ?? 0) >= 200 && (response.response?.statusCode ?? 0) <= 299{
                    let json = JSON(response.data!)
                    print(json)
                    var result = CategoryResponse()
                    print(result)
                    result.message = json["message"].string
                    //convert arr of api to my array
                    result.catArr = []
                    let apiCategories = json["data"].arrayObject
                    for item in apiCategories ?? [] {
                        let model = CollectionViewCategorySlide.init(apiModel: item as? [String : Any])
                        result.catArr?.append(model)
                    }
                    completion(nil, result)
                } else {
                    if let data = response.data {
                        let json = JSON(data)
                        print(json)
                        let message = json["message"].string
                        completion(message, nil)
                    }else {
                        completion("error occur", nil)
                    }
                }
            }
    }
    
    static func fetchingSubCategory(id: Int, completion: @escaping (_ error :String?, _ response: SubCategoryResponse?) -> Void){
        let url = URLs.subCategory + "/\(id)"
        let parameters = [
            "id": id
        ]
        let token = UserDefaults.standard.value(forKey: "token") as? String
        let bearerToken =  token != nil ? "Bearer \(token!)" : ""    // ternary Operator
        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: ["Authorization": bearerToken, "Accept": "application/json"])
            .response { response in
                if (response.response?.statusCode ?? 0) >= 200 && (response.response?.statusCode ?? 0) <= 299{
                    let json = JSON(response.data!)
                    print(json)
                    var result = SubCategoryResponse()
                    print(result)
                    result.message = json["message"].string
                    //convert arr of api to my array
                    result.subCatArr = []
                    let apiCategories = json["data"].arrayObject
                    for item in apiCategories ?? [] {
                        let model = CollectionViewCategorySlide.init(apiModel: item as? [String : Any])
                        result.subCatArr?.append(model)
                    }
                    completion(nil, result)
                } else {
//                    let json = JSON(response.data!)
//                    print(json)
//                    let message = json["message"].string
//                    completion(message, nil)
                    if let data = response.data {
                        let json = JSON(data)
                        print(json)
                        let message = json["message"].string
                        let dataFounded = json["data"].string
                        completion(dataFounded, nil)
                        completion(message, nil)
                    }else {
                        completion("error occur", nil)
                    }
                }
            }
    }
    
    static func fetchingInstOfSubCategory(id: Int, completion: @escaping (_ error :String?, _ response: InstOfSubCategoryResponse?) -> Void){
        let url = URLs.instructorOfSubCategory
        let parameters = [
            "id": id
        ]
        let token = UserDefaults.standard.value(forKey: "token") as? String
        let bearerToken =  token != nil ? "Bearer \(token!)" : ""    // ternary Operator
        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: ["Authorization": bearerToken, "Accept": "application/json"])
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
