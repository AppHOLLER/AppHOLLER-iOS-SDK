//
//  InterestingModel.swift
//  Holler
//
//  Created by Phong Nguyen on 2/18/16.
//  Copyright © 2015 Rainmaker-labs. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

final class Interest: ResponseJSONObjectSerializable, ResponseCollectionSerializable {
    var appId: String = ""
    var id: String = ""
    var name: String = ""
    
    required init?(json: SwiftyJSON.JSON) {
        
    }
    
    init(id: String, name: String, appid:String) {
        self.id = id
        self.name = name
        self.appId = appid
    }
    
    init() {
        
    }
    
    internal class func collection(representation: [String: JSON]) -> [Interest] {
        let interests: [Interest] = []
//        for obj in representation {
//            let appid = obj["application_id"].stringValue
//            let genderid = obj["id"].stringValue
//            let name = obj["gender_name"].stringValue
//            genders.append(Gender.init(id: genderid, name: name, appid: appid))
//        }
        return interests
    }
    
    internal class func collection(representation: [JSON]) -> [Interest] {
        var interests: [Interest] = []
        for obj in representation {
            let appid = obj["application_id"].stringValue
            let interestid = obj["id"].stringValue
            let name = obj["interest_name"].stringValue
            interests.append(Interest.init(id: interestid, name: name, appid: appid))
        }
        return interests
    }
    
    /**
     Get all interest
     
     - parameter completionHandler: Result<[Interest], NSError> -> Void
     */
    func getListInterest(completionHandler: (Result<[Interest], NSError>) -> Void) {
        let appkey = Defaults[Constants.Notification.APPKey].stringValue
        let authenKey = Defaults[Constants.Notification.AuthenticationKey].stringValue
        let headers = [
            Constants.HeaderRequest.HollerAppID:appkey,
            Constants.HeaderRequest.HollerAccessKey:authenKey
        ]
        
        Alamofire.request(.GET, Constants.HollerService.listInterest, encoding: .JSON,headers: headers)
            .responseCollection{response in
                completionHandler(response.result)
        }
    }
    
    /**
     Update current interest with new one
     
     - parameter completionHandler: Result<Interest, NSError> -> Void
     */
    func updateInterest(completionHandler: (Result<Interest, NSError>) -> Void){
        let appkey = Defaults[Constants.Notification.APPKey].stringValue
        let authenKey = Defaults[Constants.Notification.AuthenticationKey].stringValue
        let headers = [
            Constants.HeaderRequest.HollerAppID:appkey,
            Constants.HeaderRequest.HollerAccessKey:authenKey
        ]
        
        let params = [
            "interest_name":self.name,
            "is_published": 1
        ]
        
        Alamofire.request(.PUT, Constants.HollerService.updateInterest(Int(self.id)!), parameters: params as? [String : AnyObject], encoding: .JSON, headers: headers)
            .responseObject{ response in
                completionHandler(response.result)
        }
    }
}