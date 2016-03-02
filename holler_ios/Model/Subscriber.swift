//
//  Subscriber.swift
//  Holler
//
//  Created by Phong Nguyen on 2/16/16.
//  Copyright © 2015 Rainmaker-labs. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public class Subscriber: ResponseJSONObjectSerializable {
    public var id: String = ""
    public var firstName: String = ""
    public var lastName: String = ""
    public var email: String = ""
    public var phoneNumber: String = ""
    public var gender: String = ""
    public var interest: String = ""
    public var countryCode: String = ""
    public var userName: String = ""
    public var subscriberID: String = ""
    public var jsonInfo: [String:String]?
    
    let appkey = Defaults[Constants.Notification.APPKey].stringValue
    let authenKey = Defaults[Constants.Notification.AuthenticationKey].stringValue
    
    public var fullName: String {
        get {
            return self.fullName ?? ""
        }set(newFullName) {
            let myWordList = newFullName.wordList
            self.firstName = myWordList.first ?? ""
            self.lastName = myWordList.last ?? ""
        }
    }
    
    //MARK: -
    //MARK: Initialization
    required public init?(json: SwiftyJSON.JSON) {
        self.id = json["id"].stringValue
        self.email = json["email"].stringValue
        self.phoneNumber = json["phone"].stringValue
        self.userName = json["username"].stringValue
        self.subscriberID = json["id"].stringValue
        self.gender = json["info"]["gender"].stringValue
    }
    
    /**
     Init fully a subscriber with data
     
     - parameter firstName:    String
     - parameter lastName:     String
     - parameter email:        String
     - parameter phoneNumber:  String
     - parameter gender:       String
     - parameter interest:     String
     - parameter countryCode:  String
     - parameter userName:     String
     - parameter subscriberId: String
     - parameter jsonInfo:     [String:String]?
     
     - returns: Self
     */
    public init(firstName: String, lastName: String, email: String, phoneNumber: String,
        gender: String, interest: String, countryCode: String, userName: String,
        subscriberId: String, jsonInfo: [String:String]?){
            self.firstName = firstName
            self.lastName = lastName
            self.email = email
            self.phoneNumber = phoneNumber
            self.gender = gender
            self.interest = interest
            self.countryCode = countryCode
            self.userName = userName
            self.subscriberID = subscriberId
            self.jsonInfo = jsonInfo
    }
    
    
    //MARK: -
    //MARK: Features
    /**
     Register new Subscriber with informations
     
     - parameter completionHandler: (Result<Subscriber, NSError>) -> Void)
     */
    public func register(completionHandler: (Result<Subscriber, NSError>) -> Void) {
        let parameters : [String:AnyObject] = [
            "username":self.userName,
            "email":self.email,
            "phone":self.phoneNumber,
            "device_token":Defaults[Constants.Notification.DeviceTokenKey].stringValue,
            "device_type":"ios",
            "first_name":self.firstName,
            "last_name":self.lastName,
            "info":self.jsonInfo!]
        
        let headers = [
            Constants.HeaderRequest.HollerAppID:appkey,
            Constants.HeaderRequest.HollerAccessKey:authenKey
        ]
        
        Alamofire.request(.POST, Constants.HollerService.registerSubscribers, parameters: parameters , encoding: .JSON,headers: headers)
            .responseObject{ response in
                completionHandler(response.result)
        }
    }
    
    /**
     Update Subscriber along current location (lat, long)
     
     - parameter completionHandler: (Result<Subscriber, NSError>) -> Void)
     */
    func updateWithCurrentLocation(completionHandler: (Result<Subscriber, NSError>) -> Void) {
        let locationRequestManager = RMLLocationRequestManager.sharedInstance()
        var longitude = ""
        var latitude = ""
        
        if let location = locationRequestManager.location {
            latitude = String(location.coordinate.latitude)
            longitude = String(location.coordinate.longitude)
        }
        
        let jsonInfo = [
            "gender":"female",
            "country":self.countryCode,
            "gps_latitude":latitude,
            "gps_longitude":longitude]
        
        let parameters : [String:AnyObject] = [
            "username":self.userName,
            "email":self.email,
            "phone":self.phoneNumber,
            "device_token":Defaults[Constants.Notification.DeviceTokenKey].stringValue,
            "device_type":"ios",
            "first_name":self.firstName,
            "last_name":self.lastName,
            "info":jsonInfo]
        
        let headers = [
            Constants.HeaderRequest.HollerAppID:appkey,
            Constants.HeaderRequest.HollerAccessKey:authenKey
        ]
        
        Alamofire.request(.POST, Constants.HollerService.registerSubscribers, parameters: parameters , encoding: .JSON, headers: headers)
            .responseObject{ response in
                completionHandler(response.result)
        }
    }
    
    
    /**
     Update Subscriber's interest
     
     - parameter interestId:        String
     - parameter completionHandler: (Result<Subscriber, NSError>) -> Void)
     */
    func updateInterest(interestId: String, completionHandler: (Result<Subscriber, NSError>) -> Void){
        if let _ = self.jsonInfo{
            self.jsonInfo!["interest_id"] = interestId
        }
        
        let params : [String:AnyObject] = [
            "username":self.userName,
            "email":self.email,
            "phone":self.phoneNumber,
            "device_token":Defaults[Constants.Notification.DeviceTokenKey].stringValue,
            "device_type":"ios",
            "first_name":self.firstName,
            "last_name":self.lastName,
            "info":jsonInfo!]
        
        let headers = [
            Constants.HeaderRequest.HollerAppID:appkey,
            Constants.HeaderRequest.HollerAccessKey:authenKey
        ]
        
        Alamofire.request(.PUT, Constants.HollerService.updateSubscribers(Int(self.id)!), parameters: params, encoding: .JSON, headers: headers)
            .responseObject {response in
                completionHandler(response.result)
        }
    }
    
    /**
     Update Subscriber's Industry
     
     - parameter industryId:        String
     - parameter completionHandler: (Result<Subscriber, NSError>) -> Void)
     */
    func updateIndustry(industryId: String, completionHandler: (Result<Subscriber, NSError>) -> Void){
        if let _ = self.jsonInfo{
            self.jsonInfo!["industry"] = industryId
        }
        
        let params : [String:AnyObject] = [
            "username":self.userName,
            "email":self.email,
            "phone":self.phoneNumber,
            "device_token":Defaults[Constants.Notification.DeviceTokenKey].stringValue,
            "device_type":"ios",
            "first_name":self.firstName,
            "last_name":self.lastName,
            "info":jsonInfo!]
        
        let headers = [
            Constants.HeaderRequest.HollerAppID:appkey,
            Constants.HeaderRequest.HollerAccessKey:authenKey
        ]
        
        Alamofire.request(.PUT, Constants.HollerService.updateSubscribers(Int(self.id)!), parameters: params, encoding: .JSON, headers: headers)
            .responseObject{ response in
                completionHandler(response.result)
        }
    }
    
    /**
     Update Subscriber's Designation
     
     - parameter designationId:     String
     - parameter completionHandler: (Result<Subscriber, NSError>) -> Void)
     */
    func updateDesignation(designationId: String, completionHandler: (Result<Subscriber, NSError>) -> Void){
        if let _ = self.jsonInfo{
            self.jsonInfo!["designation"] = designationId
        }
        
        let params : [String:AnyObject] = [
            "username":self.userName,
            "email":self.email,
            "phone":self.phoneNumber,
            "device_token":Defaults[Constants.Notification.DeviceTokenKey].stringValue,
            "device_type":"ios",
            "first_name":self.firstName,
            "last_name":self.lastName,
            "info":jsonInfo!]
        
        let headers = [
            Constants.HeaderRequest.HollerAppID:appkey,
            Constants.HeaderRequest.HollerAccessKey:authenKey
        ]
        
        Alamofire.request(.PUT, Constants.HollerService.updateSubscribers(Int(self.id)!), parameters: params, encoding: .JSON, headers: headers)
            .responseObject{ response in
                completionHandler(response.result)
        }
    }
    
    /**
     Update Subscriber's location with given latitude and longitude
     
     - parameter latitude:          Float
     - parameter longitude:         Float
     - parameter completionHandler: (Result<Subscriber, NSError>) -> Void)
     */
    func updateLocation(latitude: Float, longitude: Float, completionHandler: (Result<Subscriber, NSError>) -> Void){
        if let _ = self.jsonInfo{
            self.jsonInfo!["gps_latitude"] = String(latitude)
            self.jsonInfo!["gps_longitude"] = String(longitude)
        }
        
        let params : [String:AnyObject] = [
            "username":self.userName,
            "email":self.email,
            "phone":self.phoneNumber,
            "device_token":Defaults[Constants.Notification.DeviceTokenKey].stringValue,
            "device_type":"ios",
            "first_name":self.firstName,
            "last_name":self.lastName,
            "info":jsonInfo!]
        
        let headers = [
            Constants.HeaderRequest.HollerAppID:appkey,
            Constants.HeaderRequest.HollerAccessKey:authenKey
        ]
        
        Alamofire.request(.PUT, Constants.HollerService.updateSubscribers(Int(self.id)!), parameters: params, encoding: .JSON, headers: headers)
            .responseObject{ response in
                completionHandler(response.result)
        }
    }
    
    /**
     Generate Json Information Dictionary with given data
     
     - parameter latitude:    Float
     - parameter longitude:   Float
     - parameter gender:      String
     - parameter dateOfBirth: String
     - parameter country:     String
     - parameter industry:    String
     - parameter designation: String
     - parameter interestId:  String
     
     - returns: [String:AnyObject]
     */
    public func jsonInfoForData(latitude: Float, longitude: Float, gender: String, dateOfBirth: String,
        country: String, industry: String, designation: String, interestId: String) -> [String: AnyObject]{
        return [
            "gps_latitude": latitude,
            "gps_longitude":longitude,
            "gender":gender,
            "date_of_birth":dateOfBirth,
            "country":country,
            "industry":industry,
            "designation": designation,
            "interest_id": interestId]
    }
}
