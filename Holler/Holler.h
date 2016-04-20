//
//  Holler.h
//  Holler_iOS_SDK
//
//  Created by Phong Nguyen on 4/14/16.
//  Copyright © 2016 RML. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Holler/HLError.h>
#import <Holler/HLTracking.h>
#import <Holler/HLApplication.h>
#import <Holler/HLTarget.h>
#import <Holler/HLSubscriber.h>

@interface Holler : NSObject

+(instancetype)startHolleringWithApplicationId: (NSString *)appId accessId: (NSString *)accessId;
+(instancetype)didLaunchAppWithOptions: (NSDictionary *)options;
+(void)didReceiveRemoteNotification: (NSDictionary *)userInfo;
+(void)didRegisterForRemoteNotificationWithDeviceToken: (NSData *)deviceToken;

@end
