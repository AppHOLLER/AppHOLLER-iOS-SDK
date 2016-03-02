//
//  Constants.swift
//  Holler
//
//  Created by Phong Le on 3/12/15.
//  Copyright © 2015 Rainmaker-labs. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    struct Info {
        static let SubscriberID = "kSubscriberID"
        //static let SubscriberEmail = "kSubscriberID"
    }
    
    struct Constraint {
        static let HomeConstraint = "kHomeConstraint"
        static let SuccessBottomConstraint = "kSuccessBottomConstraint"
        static let NotificationBottomConstraint = "kNotificationBottomConstraint"
    }
    
    struct Notification {
        static let DeviceTokenKey = "kDeviceToken"
        static let APPKey = "kAPP"
        static let AuthenticationKey = "kAuthentication"
    }
    
    struct Path {
        static let Documents = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        static let Tmp = NSTemporaryDirectory()
    }
    
    struct HeaderRequest {
        static let HollerAppID = "HOLLER-APP-ID"
        static let HollerAccessKey = "Holler-Access-Key"
    }
    
    struct HollerService {
        
        #if DEBUG
            static let ServiceUrl = "http://dev.holler.rainmaker-labs.com/api"
        #elseif STAGING
            static let ServiceUrl = "http://staging.holler.rainmaker-labs.com"
        #else
            static let ServiceUrl = "http://beta.appholler.com/api"
        #endif
        
        //var get api serivces
        static var allSubscriber: String{
            return "\(ServiceUrl)/subscribers/"
        }
        
        static var totalSubscriber: String{
            return"\(ServiceUrl)/total/"
        }
        
        static var listGender: String {
            return "\(ServiceUrl)/target/gender/"
        }
        
        static var listDesignation: String{
            return "\(ServiceUrl)/target/designation/"
        }
        
        static var listInterest: String {
            return "\(ServiceUrl)/target/interest/"
        }
        
        static var listIndustry: String{
            return "\(ServiceUrl)/target/industry/"
        }
        
        static var registerSubscribers: String {
            return "\(ServiceUrl)/subscribers/register/"
        }
        
        static var reachedNotification: String {
            return "\(ServiceUrl)/pushnotif/update-reached-subscriber/"
        }
        
        
        //func get api services
        static func updateSubscribers(id: Int) -> String {
            return "\(ServiceUrl)/subscribers/\(id)"
        }
        
        static func updateInterest(id: Int) -> String{
            return "\(ServiceUrl)/interest/\(id)"
        }
        
        static func updateDesignation(id: Int) ->String{
            return "\(ServiceUrl)/designation/\(id)"
        }
        
        static func updateIndustry(id: Int) -> String{
            return "\(ServiceUrl)/industry/\(id)"
        }
        
        
    }
}

struct ImageColor {
    var image: UIImage
    var color : String
    init(img: UIImage, color: String)
    {
        self.image = img
        self.color = color
    }
}

enum EImage:String{
    case Drink = "drinks"
    case Movies = "movies"
    case Fashions = "fashion"
    case FeMale = "female"
    case Male = "male"
    case Unknow = ""
}
//
//
//let deviceTokenKey = DefaultsKey<String>(Constants.NotificationDeviceTokenKey.deviceToken)