//
//  Holler_Test_Target.m
//  Holler_iOS_SDK
//
//  Created by Phong Nguyen on 4/19/16.
//  Copyright © 2016 RML. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Holler.h"
#import "HLTarget.h"

@interface Holler_Test_Target : XCTestCase

@end

@implementation Holler_Test_Target

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_getIndustry {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Testing get Industry target"];
    
    [HLTarget fetchListIndustryOnCompletion:^(BOOL succeed, NSError *error, HLError *errorObject, NSArray *industries){
        NSAssert(!error, @"Error should not be returned");
        NSAssert(industries.count != 0, @"Industries list should be greater or equals 0");
        NSAssert(!errorObject, @"Error object should not be returned");
        
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error){
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
        }
    }];
}

- (void)test_getInterest {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Testing get Industry target"];
    
    [HLTarget fetchListInterestOnCompletion:^(BOOL succeed, NSError *error, HLError *errorObject, NSArray *interests){
        NSAssert(!error, @"Error should not be returned");
        NSAssert(interests.count != 0, @"Interest list should be greater or equals 0");
        NSAssert(!errorObject, @"Error object should not be returned");
        
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error){
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
        }
    }];
}

- (void)test_getDesignation {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Testing get Industry target"];
    
    [HLTarget fetchListDesignationOnCompletion:^(BOOL succeed, NSError *error, HLError *errorObject, NSArray *designations){
        NSAssert(!error, @"Error should not be returned");
        NSAssert(designations.count != 0, @"Designation list should be greater or equals 0");
        NSAssert(!errorObject, @"Error object should not be returned");
        
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error){
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
        }
    }];
}

- (void)test_getCountry {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Testing get Industry target"];
    
    [HLTarget fetchListCountryOnCompletion:^(BOOL succeed, NSError *error, HLError *errorObject, NSArray *countries){
        NSAssert(!error, @"Error should not be returned");
        NSAssert(countries.count != 0, @"Country list should be greater or equals 0");
        NSAssert(!errorObject, @"Error object should not be returned");
        
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error){
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
        }
    }];
}

- (void)test_getLocation{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Testing get Industry target"];
    
    [HLTarget fetchListLocationOnCompletion:^(BOOL succeed, NSError *error, HLError *errorObject, NSArray *locations){
        NSAssert(!error, @"Error should not be returned");
        NSAssert(locations.count != 0, @"Location list should be greater or equals 0");
        NSAssert(!errorObject, @"Error object should not be returned");
        
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error){
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
        }
    }];
}

- (void)test_getGender{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Testing get Industry target"];
    
    [HLTarget fetchListGenderOnCompletion:^(BOOL succeed, NSError *error, HLError *errorObject, NSArray *genders){
        NSAssert(!error, @"Error should not be returned");
        NSAssert(genders.count != 0, @"Gender list should be greater or equals 0");
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
