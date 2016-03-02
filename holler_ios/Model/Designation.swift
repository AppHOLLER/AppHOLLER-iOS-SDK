//
//  Designation.swift
//  holler
//
//  Created by Phong Nguyen on 2/19/16.
//  Copyright © 2016 RML. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

final class Designation: ResponseCollectionSerializable, ResponseJSONObjectSerializable{
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
    
    internal class func collection(representation: [String: JSON]) -> [Designation] {
        let designation: [Designation] = []
//        for obj in representation {
//            let appid = obj["application_id"].stringValue
//            let genderid = obj["id"].stringValue
//            let name = obj["gender_name"].stringValue
//            genders.append(Gender.init(id: genderid, name: name, appid: appid))
//        }
        return designation
    }
    
    internal class func collection(representation: [JSON]) -> [Designation] {
        var designation: [Designation] = []
        for obj in representation {
            let appid = obj["application_id"].stringValue
            let interestid = obj["id"].stringValue
            let name = obj["interest_name"].stringValue
            designation.append(Designation.init(id: interestid, name: name, appid: appid))
        }
        return designation
    }
    
    /**
     Get all designation
     
     - parameter completionHandler: Result<[Designation], NSError> -> Void
     */
    func getListDesignation(completionHandler: (Result<[Designation], NSError>) -> Void) {
        let appkey = Defaults[Constants.Notification.APPKey].stringValue
        let authenKey = Defaults[Constants.Notification.AuthenticationKey].stringValue
        let headers = [
            Constants.HeaderRequest.HollerAppID:appkey,
            Constants.HeaderRequest.HollerAccessKey:authenKey
        ]
        
        Alamofire.request(.GET, Constants.HollerService.listDesignation, encoding: .JSON,headers: headers)
            .responseCollection{response in
                completionHandler(response.result)
        }
    }
}