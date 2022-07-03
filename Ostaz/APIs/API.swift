//
//  API.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 28/06/2022.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class API: NSObject{
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
                    print(result.user?.id)
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
}
