//
//  GenderModel.swift
//  Holler
//
//  Created by Phong Le on 22/12/15.
//  Copyright © 2015 Rainmaker-labs. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

final class Gender: ResponseJSONObjectSerializable, ResponseCollectionSerializable {
    
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
    
    internal class func collection(representation: [JSON]) -> [Gender] {
        var genders: [Gender] = []
        for obj in representation {
            let appid = obj["application_id"].stringValue
            let genderid = obj["id"].stringValue
            let name = obj["gender_name"].stringValue
            genders.append(Gender.init(id: genderid, name: name, appid: appid))
        }
        return genders
    }
    
    
    internal class func collection(representation: [String: JSON]) -> [Gender] {
        let genders: [Gender] = []
//        for obj in representation {
//            let appid = obj["application_id"].stringValue
//            let genderid = obj["id"].stringValue
//            let name = obj["gender_name"].stringValue
//            genders.append(Gender.init(id: genderid, name: name, appid: appid))
//        }
        return genders
    }
    
    /**
     Get all gender
     
     - parameter completionHandler: Result<[Gender], NSError> -> Void
     */
    func getListGender(completionHandler: (Result<[Gender], NSError>) -> Void) {
        let appkey = Defaults[Constants.Notification.APPKey].stringValue
        let authenKey = Defaults[Constants.Notification.AuthenticationKey].stringValue
        let headers = [
            Constants.HeaderRequest.HollerAppID:appkey,
            Constants.HeaderRequest.HollerAccessKey:authenKey
        ]
        
        Alamofire.request(.GET, Constants.HollerService.listGender, encoding: .JSON,headers: headers)
            .responseCollection{response in
                completionHandler(response.result)
        }
    }
}
