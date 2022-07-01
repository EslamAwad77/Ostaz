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

struct LoginResponse {
    var message: String?
    var user: UserModel?
}

class API: NSObject{
    static func fetchingLogin(email: String, password: String, completion: @escaping (_ error :String?, _ response: LoginResponse?) -> Void){
        
        let url = "https://inst.roqay.solutions/api/login"
        let parameters = [
            "email": email ,
            "password": password
        ]
        AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .response { response in
                if (response.response?.statusCode ?? 0) >= 200 && (response.response?.statusCode ?? 0) <= 299 {
                    let json = JSON(response.data)
                    var res = LoginResponse()
                    res.message = json["message"].string
                    completion(nil , res)
                }else {
                    let json = JSON(response.data)
                    let msg = json["message"].string

                    completion(msg, nil)
                }
            }
    }
    static func fetchingRegister(name: String, email: String, password: String, completion: @escaping (_ error :Error?, _ success: Bool) -> Void){
        
        let url = "https://inst.roqay.solutions/api/register"
        let parameters = [
            "name": name,
            "email": email ,
            "password": password,
            "confirmPass": password
        ]
        AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: 200..<600)
            .response { response in
                switch response.result {
                    
                case .success(let value):
                    let json = JSON(value)
                    if let apiToken = json["data"]["token"].string {
                        print("\(apiToken)")
                        completion(nil, true)
                    }
                    
                case .failure(let error):
                    print(error)
                    break
                    
                }
            }
    }
}
