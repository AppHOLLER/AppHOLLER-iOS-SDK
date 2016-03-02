//
//  RMLLocationRequestManager.swift
//  Holler
//
//  Created by Phong Le on 24/12/15.
//  Copyright © 2015 Rainmaker-labs. All rights reserved.
//

import Foundation
import MapKit

public class RMLLocationRequestManager: NSObject, CLLocationManagerDelegate {
    
    public var manager:CLLocationManager
    public dynamic var location:CLLocation?
    var operationQueue:NSOperationQueue
    var refreshOperationQueue:NSOperationQueue
    var categoryIconOperationQueue:NSOperationQueue
    var categoryIconDownloadOperationQueue:NSOperationQueue
    var userRefreshOperationQueue:NSOperationQueue
    
    //user location authorized
    dynamic var authorized:Bool = false
    
    /**
     * https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/BuildingCocoaApps/AdoptingCocoaDesignPatterns.html
     * Singleton Section
     */
    static let sharedInstancee = RMLLocationRequestManager()
    
    public class func sharedInstance() -> RMLLocationRequestManager {
        return sharedInstancee
    }
    
    public override init() {
        self.manager = CLLocationManager()
        self.manager.distanceFilter = kCLDistanceFilterNone
        self.manager.desiredAccuracy = kCLLocationAccuracyBest
        
        //setup operation queue
        operationQueue = NSOperationQueue()
        operationQueue.name = "Location operation Queue"
        operationQueue.maxConcurrentOperationCount = 2
        
        refreshOperationQueue = NSOperationQueue()
        refreshOperationQueue.name = "Refresh annotation operation queue"
        refreshOperationQueue.maxConcurrentOperationCount = 1
        
        categoryIconOperationQueue = NSOperationQueue()
        categoryIconOperationQueue.name = "Category Icon Operation Queue"
        categoryIconOperationQueue.maxConcurrentOperationCount = 5
        
        categoryIconDownloadOperationQueue = NSOperationQueue()
        categoryIconDownloadOperationQueue.name = "Download Category Icon Operation Queue"
        categoryIconDownloadOperationQueue.maxConcurrentOperationCount = 5
        
        userRefreshOperationQueue = NSOperationQueue()
        userRefreshOperationQueue.name = "User refresh Operation Queue"
        userRefreshOperationQueue.maxConcurrentOperationCount = 4
        
        super.init()
        self.manager.delegate = self
        
        if CLLocationManager.locationServicesEnabled() {
            if self.manager.respondsToSelector("requestAlwaysAuthorization") {
                if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.NotDetermined {
                    //targets to iOS 8 and upper, unneccessary to check OS version
                    self.manager.requestWhenInUseAuthorization()
                    
                    /*
                    if #available(iOS 8.0, *) {
                        self.manager.requestWhenInUseAuthorization()
                    } else {
                        // Fallback on earlier versions
                        self.manager.startUpdatingLocation()
                    }
                    */
                }
            } else {
                self.manager.startUpdatingLocation()
            }
        }else{
            //handle exception
        }
    }
    
    public func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error, terminator: "")
    }
    
    public func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
//        switch CLLocationManager.authorizationStatus() {
//        case .NotDetermined:
//            if #available(iOS 8.0, *) {
//                manager.requestAlwaysAuthorization()
//            } else {
//                // Fallback on earlier versions
//            }
//        case .Authorized:
//            manager.startUpdatingLocation()
//        case .AuthorizedWhenInUse, .Restricted, .Denied:
//            if #available(iOS 8.0, *) {
//                let alertController = UIAlertController(
//                    title: "Background Location Access Disabled",
//                    message: "In order to see local weather data, please open this app's settings and set location access to 'Always'.",
//                    preferredStyle: .Alert)
//                
//                let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
//                alertController.addAction(cancelAction)
//                
//                let openAction = UIAlertAction(title: "Open Settings", style: .Default) { (action) in
//                    if let url = NSURL(string:UIApplicationOpenSettingsURLString) {
//                        UIApplication.sharedApplication().openURL(url)
//                    }
//                }
//                alertController.addAction(openAction)
//                
//                self.presentViewController(alertController, animated: true, completion: nil)
//            } else {
//                // Fallback on earlier versions
//            }
        
        if status == CLAuthorizationStatus.AuthorizedWhenInUse {
            self.manager.startUpdatingLocation()
            self.authorized = true
        } else  if status != CLAuthorizationStatus.NotDetermined {
            self.authorized = false
        }
    }
    
    public func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        self.location = newLocation
    }
    
//    public func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
//        if (locationFixAchieved == false) {
//            locationFixAchieved = true
//            var locationArray = locations as NSArray
//            var locationObj = locationArray.lastObject as CLLocation
//            var coord = locationObj.coordinate
//            
//            
//            println(coord.latitude)
//            println(coord.longitude)
//            
//            self.userLatitude = coord.latitude
//            self.userLongitude = coord.longitude
//            
//            println(userLocation)
//            
//            getCurrentWeatherData()
//            
//        }
//    }
}