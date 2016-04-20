//
//  Holler_iOS_SDKTests.m
//  Holler_iOS_SDKTests
//
//  Created by Phong Nguyen on 4/14/16.
//  Copyright © 2016 RML. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Holler.h"
#import "HLSubscriber.h"

@interface Holler_iOS_SDKTests : XCTestCase

@end

@implementation Holler_iOS_SDKTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    [Holler startHolleringWithApplicationId:@"68dcc83f75d8fd0482b7c73953b85008a7f8a111" accessId:@"5052a944b45abee957387406df325488f33b58ca"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_getSubscriber {
    [HLSubscriber fetchListSubscriberOnCompletion:^(BOOL succeed, NSError *error, NSArray *subscribers){
        
    }];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
