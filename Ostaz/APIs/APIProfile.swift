//
//  API.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 17/07/2022.
//

import UIKit
import Alamofire
import SwiftyJSON

class APIProfile: NSObject {
    
    static func fetchingProfile(completion: @escaping (_ error :String?, _ response: ProfileResponse?) -> Void){
        let url = URLs.profile
        let token = UserDefaults.standard.value(forKey: "token") as? String
        let bearerToken =  token != nil ? "Bearer \(token!)" : ""    // ternary Operator
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["Authorization": bearerToken, "Accept": "application/json"])
            .response { response in
                if (response.response?.statusCode ?? 0) >= 200 && (response.response?.statusCode ?? 0) <= 299{
                    let json = JSON(response.data!)
                    print(json)
                    var result = ProfileResponse()
                    result.message = json["message"].string
                    result.profile = ProfileModel(apiData: json["data"].dictionaryObject)
                    print(result.profile?.email)
                    
                    //result.profile = []
//                    let apiProfile = json["data"].arrayObject
//                    for item in apiProfile ?? []{
//                        let model = ProfileModel.init(apiData: item as? [String: Any])
//                        result.profile?.append(model)
//                    }
                    completion(nil, result)
                } else {
                    let json = JSON(response.data!)
                    print(json)
                    let message = json["message"].string
                    completion(message, nil)
                }
            }
    }
    
    static func fetchingUpdateProfile(email: String, image: String, completion: @escaping (_ error :String?, _ response: UpdateResponse?) -> Void){
        let url = URLs.updateProfile
         let parameters = [
             "email": email,
             "image": image
         ]
         AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
             .response { response in
                 if (response.response?.statusCode ?? 0) >= 200 && (response.response?.statusCode ?? 0) <= 299{
                     let json = JSON(response.data!)
                     var result = UpdateResponse()
                     result.message = json["message"].string
                     completion(nil, result)
                 } else {
                     let json = JSON(response.data!)
                     let message = json["message"].string
                     completion(message, nil)
                 }
             }
     }
    
    static func fetchingEditPassword(oldPassword: String, newPassword: String, completion: @escaping (_ error :String?, _ response: EditPassResponse?) -> Void){
        let url = URLs.updateProfile
         let parameters = [
             "old_password": oldPassword,
             "new_password": newPassword,
             "new_password_confirmation": newPassword
         ]
         AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
             .response { response in
                 if (response.response?.statusCode ?? 0) >= 200 && (response.response?.statusCode ?? 0) <= 299{
                     let json = JSON(response.data!)
                     var result = EditPassResponse()
                     result.message = json["message"].string
                     completion(nil, result)
                 } else {
                     let json = JSON(response.data!)
                     let message = json["message"].string
                     completion(message, nil)
                 }
             }
     }
    
    static func fetchingUpgradeUser(phone: String, area1: Int, area2: Int, category1: Int, category2: Int, email: String , completion: @escaping (_ error :String?, _ response: UpgradeResponse?) -> Void){
        let url = URLs.upgradeUserToInstructor
         let parameters = [
             "phone": phone,
             "areas[1]": area1,
             "areas[2]": area2,
             "subspecializations[1]": category1,
             "subspecializations[2]": category2,
             "email": email
         ] as [String : Any]
         AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
             .response { response in
                 if (response.response?.statusCode ?? 0) >= 200 && (response.response?.statusCode ?? 0) <= 299{
                     let json = JSON(response.data!)
                     var result = UpgradeResponse()
                     result.message = json["message"].string
                     result.user = []
                     let apiProfile = json["data"].arrayObject
                     for item in apiProfile ?? []{
                         let model = UpgradeUserModel.init(apiModel: item as? [String: Any])
                         result.user?.append(model)

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
