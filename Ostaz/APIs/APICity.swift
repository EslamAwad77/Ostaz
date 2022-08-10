//
//  APICity.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 24/07/2022.
//

import UIKit
import Alamofire
import SwiftyJSON

class APICity: NSObject {
    static func fetchingCity(completion: @escaping (_ error :String?, _ response: CityResponse?) -> Void){
        let url = URLs.city
        let token = UserDefaults.standard.value(forKey: "token") as? String
        let bearerToken =  token != nil ? "Bearer \(token!)" : ""    // ternary Operator
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["Authorization": bearerToken])
            .response { response in
                if (response.response?.statusCode ?? 0) >= 200 && (response.response?.statusCode ?? 0) <= 299{
                    let json = JSON(response.data!)
                    print(json)
                    var result = CityResponse()
                    result.message = json["message"].string
                    result.cityValues = []
                    let apiCity = json["data"].arrayObject
                    for item in apiCity ?? []{
                        let model = CityModel.init(apiData: item as? [String: Any])
                        result.cityValues?.append(model)
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
// 2  filter and location 
