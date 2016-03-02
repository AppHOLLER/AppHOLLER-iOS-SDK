//
//  Profile.swift
//  holler
//
//  Created by Phong Nguyen on 2/29/16.
//  Copyright © 2016 RML. All rights reserved.
//

import Foundation

public class Profile: NSObject{
    
    private var accessKey: String{
        didSet{
            Defaults.remove(Constants.Notification.AuthenticationKey)
            Defaults[Constants.Notification.AuthenticationKey] = self.accessKey
        }
    }

    private var appId: String{
        didSet{
            Defaults.remove(Constants.Notification.APPKey)
            Defaults[Constants.Notification.APPKey] = self.appId
        }
    }
    
    override init() {
        self.accessKey = ""
        self.appId = ""
        
        super.init()
    }
    
    required public init(accessKey: String, appId: String){
        self.accessKey = accessKey
        self.appId = appId
    }
    
    /**
     Register app with given access key and application Id
     
     - parameter accessKey: Int
     - parameter appId:     Int
     */
    func registerApp(accessKey: String, appId: String){
        Defaults.setValue(accessKey, forKey: Constants.Notification.AuthenticationKey)
        Defaults.setValue(appId, forKey: Constants.Notification.APPKey)
    }
}