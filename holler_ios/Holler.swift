//
//  Holler.swift
//  holler
//
//  Created by Phong Nguyen on 2/17/16.
//  Copyright © 2016 RML. All rights reserved.
//

import Foundation
import Alamofire

public class Holler: NSObject{
    
    class var shareInstance: Holler{
        struct Singleton {
            static let instance = Holler()
        }
        return Singleton.instance
    }
    
    /**
     Register app with give access id and application id
     
     - parameter accessId: Int
     - parameter appId:    Int
     */
    public func registerApp(accessId: String, appId: String){
        let profile = Profile.init()
        profile.registerApp(accessId, appId: appId)
    }
}
