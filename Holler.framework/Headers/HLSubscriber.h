//
//  HLSubscriber.h
//  Holler_iOS_SDK
//
//  Created by Phong Nguyen on 4/14/16.
//  Copyright © 2016 RML. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Holler/HLError.h>

@interface HLSubscriber : NSObject

@property(atomic, readonly) NSNumber *subscriberId;
@property(nonatomic, readonly) NSDate *subscriberCreatedDate;
@property(nonatomic, readonly) NSDate *subscriberUpdatedDate;
@property(nonatomic, readonly) NSNumber *subscriberIsActive;

@property(nonatomic, weak) NSString *subscriberUsername;
@property(nonatomic, weak) NSString *subscriberEmail;
@property(nonatomic, weak) NSString *subscriberFirstName;
@property(nonatomic, weak) NSString *subscriberLastName;
@property(nonatomic, weak) NSNumber *subscriberActiveStatus;
@property(nonatomic, weak) NSString *subscriberCellphoneNumber;
@property(nonatomic, weak) NSDictionary *subscriberInformations;


-(instancetype)init;
-(instancetype)initWithJsonData: (NSDictionary *)jsonData;
-(void)updateBySubscriberId: (NSNumber *)subscriberId onCompletion: (void (^)(BOOL, NSError*, HLError*))completion;
-(void)updateBySubscriberIdSilently: (NSNumber *)subscriberId;
-(void)registerSubscriberOnCompletion: (void (^)(BOOL, NSError*,HLError*, NSNumber*))completion;
-(void)registerSubscriberSilently;

+(void)fetchListSubscriberOnCompletion: (void (^)(BOOL, NSError*,HLError*, NSArray*))completion;
+(void)fetchTotalSubscriberOnCompletion: (void (^)(BOOL, NSError*, HLError*, NSUInteger))completion;
+(void)fetchSubscriberId: (NSNumber *)subscriberId onCompletion: (void (^)(BOOL, NSError*, HLError*, HLSubscriber*))completion;

@end
