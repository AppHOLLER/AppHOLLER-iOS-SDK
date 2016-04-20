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

@interface Holler_Test_Subscriber : XCTestCase

@end

@implementation Holler_Test_Subscriber

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class
    [Holler startHolleringWithApplicationId:@"68dcc83f75d8fd0482b7c73953b85008a7f8a111" accessId:@"5052a944b45abee957387406df325488f33b58ca"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_getListSubscriber {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Testing Get List Subscriber"];
    
    [HLSubscriber fetchListSubscriberOnCompletion:^(BOOL succeed, NSError *error, HLError *errorObject, NSArray *subscribers){
        NSAssert1(subscribers.count > 0, @"Number of subscriber should greater than 0", subscribers.count);
        NSAssert(!errorObject, @"Error object should not be returned");
        
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error){
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
        }
    }];
}

-(void)test_getTotalSubscriber{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Testing get total subscriber"];
    
    [HLSubscriber fetchTotalSubscriberOnCompletion:^(BOOL succeed, NSError *error, HLError *errorObject, NSUInteger totalSubscriber){
        NSAssert1(!error, @"Error should not be returned", error);
        NSAssert1(totalSubscriber >= 0, @"Total subscriber should be greater or equals 0 (Zero)", totalSubscriber);
        NSAssert(!errorObject, @"Error object should not be returned");
        
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error){
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
        }
    }];
}

-(void)test_fetchSubscriberById{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Testing update subscriber"];
    
    [HLSubscriber fetchSubscriberId:[NSNumber numberWithInt:161] onCompletion:^(BOOL succeed, NSError *error, HLError *errorObject, HLSubscriber *subscriber){
        NSAssert1(!error, @"Error should not be returned", error);
        NSAssert1(subscriber, @"Subscriber fetched id should not be nil", subscriber);
        NSAssert(!errorObject, @"Error object should not be returned");
        
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error){
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
        }
    }];
}

-(void)test_registerSubscriber{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Testing register subscriber"];
    
    HLSubscriber *subscriber = [[HLSubscriber alloc] init];
    [subscriber setSubscriberUsername:@"KatchakamPN"];
    [subscriber setSubscriberEmail:@"phong.nguyenKAT@holler.com"];
    [subscriber setSubscriberFirstName:@"PhongKAT"];
    [subscriber setSubscriberLastName:@"NguyenKAM"];
    [subscriber setSubscriberCellphoneNumber:@"84 1203233222"];
    
    NSDictionary *informations = @{@"gps_latitude": @0,
                                   @"gps_longitude": @0,
                                   @"gender": @"male",
                                   @"date_of_birth": @"1993-6-12",
                                   @"country": @"VN",
                                   @"industry": @"",
                                   @"designation": @"",
                                   @"interest_id": @38};
    
    [subscriber setSubscriberInformations:informations];
    
    [subscriber registerSubscriberOnCompletion:^(BOOL succeed, NSError *error, HLError *errorObject, NSNumber *subscriberId){
        NSAssert(!error, @"Error should not be returned");
        NSAssert(succeed, @"Task should be completed successfully");
        NSAssert(subscriberId, @"Subscriber Id should not be nil");
        NSAssert(!errorObject, @"Error object should not be returned");
        
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error){
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
        }
    }];
}

-(void)test_updateSubscriberId{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Testing update subscriber"];
    
    [HLSubscriber fetchSubscriberId:[NSNumber numberWithInt:154] onCompletion:^(BOOL succeed, NSError *error, HLError *errorObject, HLSubscriber *subscriber){
        [subscriber setSubscriberFirstName:@"Steven"];
        [subscriber setSubscriberLastName:@"Lee"];
        
        [subscriber updateBySubscriberId:[NSNumber numberWithInt:154] onCompletion:^(BOOL succeed, NSError *error, HLError *errorObject){
            NSAssert(!error, @"Error should not be returned");
            NSAssert(succeed, @"Update should be succeeded");
            NSAssert(!errorObject, @"Error object should not be returned");
            
            [expectation fulfill];
        }];
    }];
    
    [self waitForExpectationsWithTimeout:1000 handler:^(NSError *error){
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
