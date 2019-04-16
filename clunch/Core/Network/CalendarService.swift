//
//  CalendarService.swift
//  clunch
//
//  Created by Samy on 14/04/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias CallbackCalendar = (_ res: [[String: Any]], _ error: Error?) -> Void

class CalendarService {
    static func getEventListByDateAction(companyId: Int, date: Date, callBack: @escaping CallbackCalendar) {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd.MM.yyyy"

        let dateFormat = dateFormatterPrint.string(from: date)
        
        Alamofire.request(UrlBuilder.dateEventsUrl(id: String(companyId), date: dateFormat), method: .get, parameters: nil, encoding: JSONEncoding.default, headers: AuthService.getHeadersAction()).responseJSON(completionHandler: { response in
            
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
}
