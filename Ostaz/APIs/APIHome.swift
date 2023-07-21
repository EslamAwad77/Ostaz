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
        //let token = UserDefaults.standard.value(forKey: "token") as? String
        //let bearerToken =  token != nil ? "Bearer \(token!)" : ""    // ternary Operator
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
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
                        let model = UserModel.init(apiData: item as? [String : Any])
                        result.homeMostViewed?.append(model)
                    }
                    
                    
                    result.homePaidInstructor = []
                    let apiPaidInstructor = json["data"]["paid_instructors"].arrayObject
                    for item in apiPaidInstructor ?? [] {
                        let model = UserModel.init(apiData: item as? [String : Any])
                        result.homePaidInstructor?.append(model)
                    }
                    
               
                    print(result.homeMostViewed!)
                    print(result.homePaidInstructor!)
                    completion(nil, result)
                } else {
                    let json = JSON(response.data!)
                    print(json)
                    let message = json["message"].string
                    completion(message, nil)
                }
            }
    }
    

    static func fetchingSearch(text: String, specialization: Int, area: String, city: String, completion: @escaping (_ error :String?, _ response: SearchResponse?) -> Void){
        let url = URLs.search
        let parameters: [String: Any] = [
            "text": text,
            "specialization": specialization,
            "area": area,
            "city": city
        ]
        let token = UserDefaults.standard.value(forKey: "token") as? String
        let bearerToken =  token != nil ? "Bearer \(token!)" : ""    // ternary Operator
        AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: ["Authorization": bearerToken])
            .response { response in
                if (response.response?.statusCode ?? 0) >= 200 && (response.response?.statusCode ?? 0) <= 299{
                    let json = JSON(response.data!)
                    print(json)
                    var result = SearchResponse()
                    result.message = json["message"].string
                    result.homeSearch = []
                    let apiSearch = json["data"]["data"].arrayObject
                    for item in apiSearch ?? []{
                        let model = UserModel(apiData: item as? [String: Any])
                        result.homeSearch?.append(model)
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
    

}
