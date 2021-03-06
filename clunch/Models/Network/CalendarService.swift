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
typealias CallbackEvents = (_ res: [Event], _ error: Error?) -> Void

class CalendarService {
    static func getEventListByDateAction(companyId: Int, date: Date, callBack: @escaping CallbackCalendar) {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy-MM-dd HH:mm"

        let dateFormat = dateFormatterPrint.string(from: date)
        
        Alamofire.request(UrlBuilder.dateEventsUrl(id: String(companyId), date: dateFormat), method: .get, parameters: nil, encoding: JSONEncoding.default, headers: AuthService.getHeadersAction()).responseJSON(completionHandler: { response in
            
            switch response.result {
            case .success(let value):

                callBack(value as! [[String : Any]], nil)
                
            case .failure(let error):
                print(error)
                break
            }
        })
    }
    
    static func getEventListByCompagny(companyId: Int, callBack: @escaping CallbackEvents) {
        Alamofire.request(UrlBuilder.getEventsByCompagny(id: String(companyId)), method: .get, parameters: nil, encoding: JSONEncoding.default, headers: AuthService.getHeadersAction()).responseJSON(completionHandler: { response in

            switch response.result {
            case .success(let value):
                var eventslist : [Event] = []
                var jsonTab: JSON = JSON(value)
                var i:Int = 0
                var json:JSON = jsonTab[i]
                while (json != JSON.null){
                    let id = json["id"].int ?? 0
                    let recipe = json["recipe"].string ?? ""
                    let description = json["description"].string ?? ""
                    let dateStr: String = json["date"].string!
                    let limitDateStr: String = json["limitDate"].string!
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
                    let date:Date = dateFormatter.date(from: dateStr)!
                    let limitDate:Date = dateFormatter.date(from: limitDateStr)!
                    let quantity = json["quantity"].int ?? 0
                    
                    let userId = json["user"]["id"].int ?? 0
                    let username = json["user"]["username"].string ?? ""
                    let compagnyId = json["user"]["company"]["id"].int ?? 0
                    
                    let user:User = User(userId: userId, username: username, email: "", token: "", companyId: compagnyId)
                    
                    let participantsTab:JSON = json["participants"]
                    var allParticipatns : [User] = []
                    var j:Int = 0
                    var singleParticipant:JSON = participantsTab[j]
                    while (singleParticipant != JSON.null){
                        
                        let id = singleParticipant["id"].int ?? 0
                        let username = singleParticipant["username"].string ?? ""
                        let cmpId = singleParticipant["company"]["id"].int ?? 0
                        
                        let tmpPart: User = User(userId: id, username: username, companyId: cmpId)
                        allParticipatns.append(tmpPart)
                        j += 1
                        singleParticipant = participantsTab[j]
                    }
                    let tmpEvent = Event(id: id, recipe: recipe, description: description, date: date, user: user, quantity: quantity, participants: allParticipatns, limitDate: limitDate)
                    
                    eventslist.append(tmpEvent)
                    
                    i += 1
                    json = jsonTab[(i)]
                }

                callBack(eventslist, nil)
                
            case .failure(let error):
                print(error)
                break
            }
        })
    }
}


