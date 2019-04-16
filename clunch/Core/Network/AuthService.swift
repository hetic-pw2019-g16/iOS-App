//
//  AuthService.swift
//  clunch
//
//  Created by Samy on 14/04/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias CallbackAuth = (_ res: Any, _ error: Error?) -> Void

class AuthService {
    static func userCheckAction(body: [String : Any], callBack: @escaping CallbackAuth) {
        Alamofire.request(UrlBuilder.userCheckUrl(), method: .post, parameters: body as Parameters, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler: { response in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                callBack(json, nil)
            
            case .failure(let error):
                print(error)
                break
            }
        })
    }
    
    static func loginAction(body: [String : Any], callBack: @escaping CallbackAuth) {
        Alamofire.request(UrlBuilder.loginUrl(), method: .post, parameters: body as Parameters, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler: { response in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let userId = json["user"]["id"].int ?? 0
                let username = json["user"]["username"].string ?? ""
                let email = json["user"]["email"].string ?? ""
                let token = json["token"].string ?? ""
                
                let user = User.init(userId: userId, username: username, email: email, token: token)
                
                callBack(user, nil)
                
            case .failure(let error):
                print(error)
                break
            }
        })
    }
    
    static func getHeadersAction() -> HTTPHeaders {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer " + UserDefaults.getToken()!,
        ]
        
        return headers
    }
}
