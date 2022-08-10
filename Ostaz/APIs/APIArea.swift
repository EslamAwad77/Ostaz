//
//  APIArea.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 24/07/2022.
//

import UIKit
import Alamofire
import SwiftyJSON

class APIArea: NSObject {
    static func fetchingArea(city: [Int], completion: @escaping (_ error :String?, _ response: AreaResponse?) -> Void){
        let url = URLs.register
        let parameters = [
            "cities_id" : city
        ]
        AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .response { response in
                if (response.response?.statusCode ?? 0) >= 200 && (response.response?.statusCode ?? 0) <= 299{
                    let json = JSON(response.data!)
                    var result = AreaResponse()
                    result.message = json["message"].string
                    result.areaValues = []
                    let apiArea = json["data"].arrayObject
                    for item in apiArea ?? [] {
                        let model = AreaModel.init(apiData: item as? [String: Any])
                        result.areaValues?.append(model)
                    }
                    completion(nil, result)
                } else {
                    let json = JSON(response.data!)
                    let message = json["message"].string
                    completion(message, nil)
                }
            }
    }
}

// 3  filter and location and promotion
