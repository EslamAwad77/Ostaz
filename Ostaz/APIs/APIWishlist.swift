//
//  APIWishlist.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 17/07/2022.
//

import UIKit
import Alamofire
import SwiftyJSON

class APIWishlist: NSObject {
    
    static func fetchingWishList( completion: @escaping (_ error :String?, _ response: WishListResponse?) -> Void){
        let url = URLs.wishlist
        let token = UserDefaults.standard.value(forKey: "token") as? String
        let bearerToken =  token != nil ? "Bearer \(token!)" : ""    // ternary Operator
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["Authorization": bearerToken, "Accept": "application/json"])
            .response { response in
                if (response.response?.statusCode ?? 0) >= 200 && (response.response?.statusCode ?? 0) <= 299{
                    let json = JSON(response.data!)
                    print(json)
                    var result = WishListResponse()
                    result.message = json["message"].string
                    
                    result.wishListArr = []
                    let apiWishList = json["data"]["data"].arrayObject
                    //print(apiWishList!)
                    for item in apiWishList ?? [] {
                        let model = UserModel.init(apiData: item as? [String: Any])
                        result.wishListArr?.append(model)
                    }
                    
                    print(result.wishListArr!)
                    completion(nil, result)
                } else {
                    let json = JSON(response.data!)
                    print(json)
                    let message = json["message"].string
                    completion(message, nil)
                }
            }
    }
    
    static func fetchingAddToWishList(favouriteId: Int, completion: @escaping (_ error :String?, _ response: WishListResponse?) -> Void){
        let url = URLs.addToWishlist
         let parameters = [
             "favourite_id": favouriteId
         ]
         AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
             .response { response in
                 if (response.response?.statusCode ?? 0) >= 200 && (response.response?.statusCode ?? 0) <= 299{
                     let json = JSON(response.data!)
                     var result = WishListResponse()
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
