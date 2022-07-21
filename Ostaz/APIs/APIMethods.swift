//
//  APIMethods.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 19/07/2022.
//

import UIKit
import Alamofire
import SwiftyJSON

class APIMethods: NSObject {
    
    static func fetchingMehtodsList(completion: @escaping (_ error :String?, _ response: ListOfMehtodsResponse?) -> Void){
        let url = URLs.methodsList
        let token = UserDefaults.standard.value(forKey: "token") as? String
        let bearerToken =  token != nil ? "Bearer \(token!)" : ""    // ternary Operator
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["Authorization": bearerToken, "Accept": "application/json"])
            .response { response in
                if (response.response?.statusCode ?? 0) >= 200 && (response.response?.statusCode ?? 0) <= 299{
                    let json = JSON(response.data!)
                    print(json)
                    var result = ListOfMehtodsResponse()
                    result.message = json["message"].string
                    result.arrOfList = []
                    let apiMehtod = json["data"].arrayObject
                    for item in apiMehtod ?? [] {
                        let model = MethodModel.init(apiMethod: item as? [String: Any])
                        result.arrOfList?.append(model)
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
    
    static func fetchingCreateMethod(name: String, completion: @escaping (_ error :String?, _ response: CreateMethodResponse?) -> Void){
        let url = URLs.methodCreate
         let parameters = [
             "name": name
         ]
         AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
             .response { response in
                 if (response.response?.statusCode ?? 0) >= 200 && (response.response?.statusCode ?? 0) <= 299{
                     let json = JSON(response.data!)
                     var result = CreateMethodResponse()
                     result.message = json["message"].string
                     completion(nil, result)
                 } else {
                     let json = JSON(response.data!)
                     let message = json["message"].string
                     completion(message, nil)
                 }
             }
     }
}
