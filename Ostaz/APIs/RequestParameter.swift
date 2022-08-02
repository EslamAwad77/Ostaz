//
//  LoginRe.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 31/07/2022.
//

import Foundation
import Alamofire
import SwiftyJSON


struct RequestParameter{
    var url: String?
    var method: HTTPMethod?
    var parameters: [String: Any]? = nil
    var headers: HTTPHeaders? = nil
    var completion: (_ error :String?, _ response: JSON?) -> Void
}
