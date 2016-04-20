//
//  HLError.h
//  Holler_iOS_SDK
//
//  Created by Phong Nguyen on 4/14/16.
//  Copyright © 2016 RML. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *HollerServiceURL;

@class HLSubscriber;

@interface HLMiscellaneous : NSObject

+(NSString *)perceiveAPI:(NSString *)request;
+(NSDictionary *)perceiveHeaderCredential;
+(BOOL)perceiveDeviceToken: (NSData *)deviceToken;

//Subscriber Manipulation
+(NSDictionary *)deserialiseSubscriber: (HLSubscriber*)subscriber;
+(NSData *)deserialiseSubscriberToData: (HLSubscriber*)subscriber error: (NSError**)error;

//Device token Manipulation
+(NSString *)deviceTokenForData: (NSData *)data;

//Push Notification Manipulation
+(NSString *)detachCommunicationIdFromPayload: (NSDictionary *)payload;
+(NSDictionary *)serialisePushNotificationReceivedFromPayload: (NSDictionary *)payload;
@end