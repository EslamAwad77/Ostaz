//  API.swift
//  Ostaz
//  Created by eslam awad elsayed awad on 28/06/2022.
import UIKit
import Alamofire
import SwiftyJSON

class APIAuth: NSObject{
    
    static func fetchingLogin(email: String, password: String, completion: @escaping (_ error :String?, _ response: LoginResponse?) -> Void){
        let url = URLs.login
        let parameters = [
            "email": email ,  // "email" parameters in the api
            "password": password
        ]
        AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .response { response in
                if (response.response?.statusCode ?? 0) >= 200 && (response.response?.statusCode ?? 0) <= 299 {
                    let json = JSON(response.data!)
                    var result = LoginResponse()
                    result.message = json["message"].string
                    result.user = UserModel(apiData: json["data"].dictionaryObject)
//                    result.user = []
//                    let apiLogin = json["data"].arrayObject
//                    for item in apiLogin ?? [] {
//                        let model = UserModel.init(apiData: item as? [String: Any])
//                        result.user?.append(model)
//                    } // for array 
                    
                    print(result.user!.id!)
                    
                    completion(nil , result)
                }else {
                    let json = JSON(response.data!)
                    let msg = json["message"].string
                    completion(msg, nil)
                }
            }
    }
   
    static func fetchingRegister(name: String, email: String, password: String, completion: @escaping (_ error :String?, _ response: RegisterResponse?) -> Void){
        let url = URLs.register
        let parameters = [
            "name": name,
            "email": email ,
            "password": password,
            "password_confirmation": password
        ]
        AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .response { response in
                if (response.response?.statusCode ?? 0) >= 200 && (response.response?.statusCode ?? 0) <= 299{
                    let json = JSON(response.data!)
                    var result = RegisterResponse()
                    result.message = json["message"].string
                    completion(nil, result)
                } else {
                    let json = JSON(response.data!)
                    let message = json["message"].string
                    completion(message, nil)
                }
            }
    }
    
    static func fetchingLogout(completion: @escaping (_ error :String?, _ response: LogoutResponse?) -> Void){
        let url = URLs.logout
        let token = UserDefaults.standard.value(forKey: "token") as? String
        let bearerToken =  token != nil ? "Bearer \(token!)" : ""    // ternary Operator
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["Authorization": bearerToken])
            .response { response in
                if (response.response?.statusCode ?? 0) >= 200 && (response.response?.statusCode ?? 0) <= 299{
                    let json = JSON(response.data!)
                    print(json)
                    var result = LogoutResponse()
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
    
     static func fetchingFrogetPass(email: String, completion: @escaping (_ error :String?, _ response: FrogetResponse?) -> Void){
         let url = URLs.froget
         let parameters = [
             "email": email
         ]
         AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
             .response { response in
                 if (response.response?.statusCode ?? 0) >= 200 && (response.response?.statusCode ?? 0) <= 299{
                     let json = JSON(response.data!)
                     var result = FrogetResponse()
                     result.message = json["message"].string
                     completion(nil, result)
                 } else {
                     let json = JSON(response.data!)
                     let message = json["message"].string
                     completion(message, nil)
                 }
             }
     }
    
    static func fetchingResetPass(otp: String, password: String, confirmPassword: String, completion: @escaping (_ error :String?, _ response: ResetResponse?) -> Void){
        let url = URLs.reset
        let parameters = [
            "otp": otp,
            "password": password,
            "password_confirmation": confirmPassword
        ]
        AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .response { response in
                if (response.response?.statusCode ?? 0) >= 200 && (response.response?.statusCode ?? 0) <= 299{
                    let json = JSON(response.data!)
                    var result = ResetResponse()
                    result.message = json["message"].string
                    completion(nil, result)
                } else {
                    let json = JSON(response.data!)
                    let message = json["message"].string
                    completion(message, nil)
                }
            }
    }
    
    static func fetchingSetLocation(areaId: String, completion: @escaping (_ error :String?, _ response: SetLocationResponse?) -> Void){
        let url = URLs.setLocation
        let parameters = [
            "area_id": areaId
        ]
        AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .response { response in
                if (response.response?.statusCode ?? 0) >= 200 && (response.response?.statusCode ?? 0) <= 299{
                    let json = JSON(response.data!)
                    var result = SetLocationResponse()
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
