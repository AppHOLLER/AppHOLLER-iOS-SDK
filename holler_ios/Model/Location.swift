//
//  Location.swift
//  holler
//
//  Created by Phong Nguyen on 2/19/16.
//  Copyright © 2016 RML. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

final class Location: ResponseCollectionSerializable, ResponseJSONObjectSerializable{
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
    
    internal class func collection(representation: [String: JSON]) -> [Location] {
        let locations: [Location] = []
//        for obj in representation {
//            let appid = obj["application_id"].stringValue
//            let genderid = obj["id"].stringValue
//            let name = obj["gender_name"].stringValue
//            genders.append(Gender.init(id: genderid, name: name, appid: appid))
//        }
        return locations
    }
    
    internal class func collection(representation: [JSON]) -> [Location] {
        var locations: [Location] = []
        for obj in representation {
            let appid = obj["application_id"].stringValue
            let interestid = obj["id"].stringValue
            let name = obj["interest_name"].stringValue
            locations.append(Location.init(id: interestid, name: name, appid: appid))
        }
        return locations
    }
}