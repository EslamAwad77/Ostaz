//
//  GeneralAPI.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 31/07/2022.
//

import UIKit
import Alamofire
import SwiftyJSON

 class GeneralAPI: NSObject {
    
     static func fetchingData(request: RequestParameter){
        
         AF.request(request.url!, method: request.method ?? .post, parameters: request.parameters, encoding: URLEncoding.default, headers: request.headers)
            .response { response in
                if (response.response?.statusCode ?? 0) >= 200 && (response.response?.statusCode ?? 0) <= 299 {
                    let json = JSON(response.data!)
                    request.completion(nil,json)
                }else {
                    let json = JSON(response.data!)
                    let msg = json["message"].string
                    request.completion(msg, nil)
                }
            }
    }

}
