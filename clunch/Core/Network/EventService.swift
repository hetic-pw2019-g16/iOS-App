//
//  EventService.swift
//  clunch
//
//  Created by Samy on 22/04/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias CallbackEvent = (_ res: JSON, _ error: Error?) -> Void

class EventService {
    static func addEventAction(id: Int, body: [String : Any], callBack: @escaping CallbackEvent) {
        Alamofire.request(UrlBuilder.addEventsUrl(id: String(id)), method: .post, parameters: body as Parameters, encoding: JSONEncoding.default, headers: AuthService.getHeadersAction()).responseJSON(completionHandler: { response in
            
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
    
    static func participationToEventAction(eventId: Int, userId: Int, state: Bool, callBack: @escaping CallbackEvent) {
        Alamofire.request(UrlBuilder.participationToEventUrl(eventId: String(eventId), userId: String(userId), state: state), method: .post, parameters: nil, encoding: JSONEncoding.default, headers: AuthService.getHeadersAction()).responseJSON(completionHandler: { response in
            
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
}
