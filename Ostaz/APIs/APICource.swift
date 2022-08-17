//
//  APICource.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 17/08/2022.
//

import UIKit
import Alamofire
import SwiftyJSON

class APICource: NSObject {
    static func getMyCourses(completion: @escaping (_ error :String?, _ response: CourseResponse?) -> Void){
        let url = URLs.getCourses
        let token = UserDefaults.standard.value(forKey: "token") as? String
        let bearerToken =  token != nil ? "Bearer \(token!)" : ""    // ternary Operator
        AF.request(url, method: .post, parameters: nil, encoding: URLEncoding.default, headers: ["Authorization": bearerToken, "Accept": "application/json"])
            .response { response in
                if (response.response?.statusCode ?? 0) >= 200 && (response.response?.statusCode ?? 0) <= 299{
                    let json = JSON(response.data!)
                    var result = CourseResponse()
                    result.message = json["message"].string
                    result.courses = []
                    let apiCourse = json["data"].arrayObject
                    for item in apiCourse ?? []{
                        let model = CourseModel.init(apiData: item as? [String: Any])
                        //result.courses?.append(model)
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
