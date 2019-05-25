//
//  RecipeService.swift
//  clunch
//
//  Created by Samy on 14/04/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias CallbackCategory = (_ res: [[String: Any]], _ error: Error?) -> Void
typealias CallbackRecipe = (_ res: [[String: Any]], _ error: Error?) -> Void

class RecipeService {
    static func getCategoryListAction(callBack: @escaping CallbackCategory) {
        Alamofire.request(UrlBuilder.categoryListUrl(), method: .get, parameters: nil, encoding: JSONEncoding.default, headers: AuthService.getHeadersAction()).responseJSON(completionHandler: { response in
            
            switch response.result {
            case .success(let value):                
            
                // TODO -> Work With Model to prevent errors
                callBack(value as! [[String : Any]], nil)
                
            case .failure(let error):
                print(error)
                break
            }
        })
    }
    
    static func getCategoryItemAction(id: Int,callBack: @escaping CallbackRecipe) {
        Alamofire.request(UrlBuilder.categoryItemUrl(id: String(id)), method: .get, parameters: nil, encoding: JSONEncoding.default, headers: AuthService.getHeadersAction()).responseJSON(completionHandler: { response in
            
            switch response.result {
            case .success(let value):
                
                // TODO -> Work With Model to prevent errors
                print(value)
                callBack(value as! [[String: Any]], nil)
                
            case .failure(let error):
                print(error)
                break
            }
        })
    }
}
