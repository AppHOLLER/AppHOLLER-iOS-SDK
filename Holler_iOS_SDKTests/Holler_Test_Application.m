//
//  Holler_Test_Application.m
//  Holler_iOS_SDK
//
//  Created by Phong Nguyen on 4/19/16.
//  Copyright © 2016 RML. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Holler.h"
#import "HLApplication.h"

@interface Holler_Test_Application : XCTestCase

@end

@implementation Holler_Test_Application

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_getApplicationById {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Testing get application by Id"];
    
    [HLApplication fetchApplicationById:@"68dcc83f75d8fd0482b7c73953b85008a7f8a111" onCompletion:^(BOOL succeed, NSError *error, HLError *errorObject, HLApplication *application){
        NSAssert(!error, @"Error should not be returned");
        NSAssert(application, @"Application should be got");
        NSAssert(!errorObject, @"Error object should not be returned");
        
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error){
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
        }
    }];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
