//
//  APIHome.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 17/07/2022.
//

import UIKit
import Alamofire
import SwiftyJSON

class APIHome: NSObject {
    
    
    static func fetchingHome(completion: @escaping (_ error :String?, _ response: HomeResponse?) -> Void){
        let url = URLs.home
        let token = UserDefaults.standard.value(forKey: "token") as? String
        let bearerToken =  token != nil ? "Bearer \(token!)" : ""    // ternary Operator
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["Authorization": bearerToken])
            .response { response in
                if (response.response?.statusCode ?? 0) >= 200 && (response.response?.statusCode ?? 0) <= 299{
                    let json = JSON(response.data!)
                    print(json)
                    var result = HomeResponse()
                    result.message = json["message"].string
                    
                    result.homeCategory = []
                    let apiCategories = json["data"]["categories"].arrayObject
                    for item in apiCategories ?? [] {
                        let model = HomeCategoryModel.init(apiModel: item as? [String : Any])
                        result.homeCategory?.append(model)
                    }
                    
                    
                    result.homeMostViewed = []
                    let apiMostViewed = json["data"]["most_viewd"].arrayObject
                    for item in apiMostViewed ?? [] {
                        let model = HomeMostViewedModel.init(apiData: item as? [String : Any])
                        result.homeMostViewed?.append(model)
                    }
                    
                    
                    result.homePaidInstructor = []
                    let apiPaidInstructor = json["data"]["paid_instructors"].arrayObject
                    for item in apiPaidInstructor ?? [] {
                        let model = HomePaidInstructorsModel.init(apiData: item as? [String : Any])
                        result.homePaidInstructor?.append(model)
                    }
                    
               
                    
                    completion(nil, result)
                } else {
                    let json = JSON(response.data!)
                    print(json)
                    let message = json["message"].string
                    completion(message, nil)
                }
            }
    }
    

    static func fetchingSearch(completion: @escaping (_ error :String?, _ response: SearchResponse?) -> Void){
        let url = URLs.Search
        let token = UserDefaults.standard.value(forKey: "token") as? String
        let bearerToken =  token != nil ? "Bearer \(token!)" : ""    // ternary Operator
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["Authorization": bearerToken])
            .response { response in
                if (response.response?.statusCode ?? 0) >= 200 && (response.response?.statusCode ?? 0) <= 299{
                    let json = JSON(response.data!)
                    print(json)
                    var result = SearchResponse()
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
    
//    static func fetchingGetAllCate(completion: @escaping (_ error :String?, _ response: GetAllCateResponse?) -> Void){
//        let url = URLs.getAllCategories
//        let token = UserDefaults.standard.value(forKey: "token") as? String
//        let bearerToken =  token != nil ? "Bearer \(token!)" : ""    // ternary Operator
//        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["Authorization": bearerToken])
//            .response { response in
//                if (response.response?.statusCode ?? 0) >= 200 && (response.response?.statusCode ?? 0) <= 299{
//                    let json = JSON(response.data!)
//                    print(json)
//                    var result = GetAllCateResponse()
//                    result.message = json["message"].string
//                    completion(nil, result)
//                } else {
//                    let json = JSON(response.data!)
//                    print(json)
//                    let message = json["message"].string
//                    completion(message, nil)
//                }
//            }
//    }
//    
//    static func fetchingGetAllInst(completion: @escaping (_ error :String?, _ response: GetAllInstResponse?) -> Void){
//        let url = URLs.getAllInstructors
//        let token = UserDefaults.standard.value(forKey: "token") as? String
//        let bearerToken =  token != nil ? "Bearer \(token!)" : ""    // ternary Operator
//        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["Authorization": bearerToken])
//            .response { response in
//                if (response.response?.statusCode ?? 0) >= 200 && (response.response?.statusCode ?? 0) <= 299{
//                    let json = JSON(response.data!)
//                    print(json)
//                    var result = GetAllInstResponse()
//                    result.message = json["message"].string
//                    completion(nil, result)
//                } else {
//                    let json = JSON(response.data!)
//                    print(json)
//                    let message = json["message"].string
//                    completion(message, nil)
//                }
//            }
//    }
}
