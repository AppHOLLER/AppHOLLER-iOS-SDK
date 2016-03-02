//
//  Industry.swift
//  holler
//
//  Created by Phong Nguyen on 2/18/16.
//  Copyright © 2016 RML. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

final class Industry: ResponseCollectionSerializable, ResponseJSONObjectSerializable{
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
    
    internal class func collection(representation: [String: JSON]) -> [Industry] {
        let industry: [Industry] = []
//        for obj in representation {
//            let appid = obj["application_id"].stringValue
//            let genderid = obj["id"].stringValue
//            let name = obj["gender_name"].stringValue
//            genders.append(Gender.init(id: genderid, name: name, appid: appid))
//        }
        return industry
    }
    
    internal class func collection(representation: [JSON]) -> [Industry] {
        var industry: [Industry] = []
        for obj in representation {
            let appid = obj["application_id"].stringValue
            let interestid = obj["id"].stringValue
            let name = obj["interest_name"].stringValue
            industry.append(Industry.init(id: interestid, name: name, appid: appid))
        }
        return industry
    }
    
    /**
     Update current Industry with new one
     
     - parameter completionHandler: Result<Industry, NSError> -> Void
     */
    internal func update(completionHandler: (Result<Industry, NSError>) -> Void){
        let appkey = Defaults[Constants.Notification.APPKey].stringValue
        let authenKey = Defaults[Constants.Notification.AuthenticationKey].stringValue
        let headers = [
            Constants.HeaderRequest.HollerAppID:appkey,
            Constants.HeaderRequest.HollerAccessKey:authenKey
        ]
        
        let params = [
            "industry_name":self.name,
            "is_published": 1
        ]
        
        Alamofire.request(.PUT, Constants.HollerService.updateIndustry(Int(self.id)!), parameters: params as? [String : AnyObject], encoding: .JSON, headers: headers)
            .responseObject{response in
                completionHandler(response.result)
        }
    }
    
    /**
     Get all industry
     
     - parameter completionHandler: Result<[Industry], NSError> -> Void
     */
    internal func getListIndustry(completionHandler: (Result<[Industry], NSError>) -> Void) {
        let appkey = Defaults[Constants.Notification.APPKey].stringValue
        let authenKey = Defaults[Constants.Notification.AuthenticationKey].stringValue
        let headers = [
            Constants.HeaderRequest.HollerAppID:appkey,
            Constants.HeaderRequest.HollerAccessKey:authenKey
        ]
        
        Alamofire.request(.GET, Constants.HollerService.listIndustry, encoding: .JSON,headers: headers)
            .responseCollection{response in
                completionHandler(response.result)
        }
    }
}
