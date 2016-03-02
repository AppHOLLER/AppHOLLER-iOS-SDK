//
//  HollerService.swift
//  holler
//
//  Created by Phong Nguyen on 2/17/16.
//  Copyright © 2016 RML. All rights reserved.
//

import Foundation
import Alamofire

let appkey = Defaults[Constants.Notification.APPKey].stringValue
let authenKey = Defaults[Constants.Notification.AuthenticationKey].stringValue

let headers = [
    Constants.HeaderRequest.HollerAppID:appkey,
    Constants.HeaderRequest.HollerAccessKey:authenKey
]

public class HollerServiceManager: NSObject{
    class var shareInstance: HollerServiceManager{
        struct Singleton {
            static let instance = HollerServiceManager()
        }
        return Singleton.instance
    }
}