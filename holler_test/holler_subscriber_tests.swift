//
//  holler_subscriber_tests.swift
//  holler
//
//  Created by Phong Nguyen on 2/17/16.
//  Copyright © 2016 RML. All rights reserved.
//

import XCTest
import Holler
import Alamofire
import SwiftyJSON

class holler_subscriber_tests: XCTestCase {

    override func setUp() {
        super.setUp()
        
        let subscriber = Subscriber.init(firstName: "Steven", lastName: "Hawk", email: "steven.hawk@gmail.com", phoneNumber: "65 0332323", gender: "Male", interest: "1", countryCode: "2", userName: "steven.hawk@gmail.com", subscriberId: "", jsonInfo: nil)
        subscriber.register{response in
           println("Res: \(response)")
        }
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func test_registerSubcriber(){
        
    }
    
    func test_updateSubscriber(){
        
    }
    
    func test_findAllSubscriber(){
        
    }
    
    func test_getTotalSubscriber(){
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
}
