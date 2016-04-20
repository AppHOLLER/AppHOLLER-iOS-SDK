//
//  Holler.m
//  Holler_iOS_SDK
//
//  Created by Phong Nguyen on 4/14/16.
//  Copyright © 2016 RML. All rights reserved.
//

#import "Holler.h"

#import <Holler/HLConstants.h>
#import <Holler/HLServiceManager.h>
#import <Holler/HLMiscellaneous.h>

@implementation Holler

+(instancetype)startHolleringWithApplicationId:(NSString *)appId accessId:(NSString *)accessId{
    static dispatch_once_t onceToken;
    static Holler *holler;
    dispatch_once(&onceToken, ^{
        holler = [[Holler alloc] init];
        [holler perceiveCredentials:appId accessId:accessId];
    });
    
    return holler;
}

+(instancetype)didLaunchAppWithOptions:(NSDictionary *)options{
    static dispatch_once_t onceToken;
    static Holler *holler;
    dispatch_once(&onceToken, ^{
        holler = [[Holler alloc] init];
        [holler detachApplicationCrdentials:options];
    });
    
    return holler;
}

+(void)didRegisterForRemoteNotificationWithDeviceToken:(NSData *)deviceToken{
    [HLMiscellaneous perceiveDeviceToken:deviceToken];
}

+(void)didReceiveRemoteNotification:(NSDictionary *)userInfo{
    [[HLServiceManager standardManager] executeRESTRequestWithCredential:HOLLER_SERVICE_RECEIVE_PUSH_NOTIFICATION method:HL_HTTP_POST objectId:nil params:[HLMiscellaneous serialisePushNotificationReceivedFromPayload:userInfo] onCompletion:nil];
}


#pragma mark - Detach
-(BOOL)detachApplicationCrdentials: (NSDictionary *)credentialInLaunchOptions{
    NSString *applicationId = [credentialInLaunchOptions objectForKey:HLApplicationId];
    NSString *accessId = [credentialInLaunchOptions objectForKey:HLAccessId];
    
    if(!applicationId || !accessId){
        return NO;
    }else{
        [self perceiveCredentials:applicationId accessId:accessId];
        return YES;
    }
}

-(void)perceiveCredentials: (nonnull NSString *)appId accessId: (nonnull NSString *)accessId{
    [HollerUserDefaults setObject:appId forKey:HOLLERAppId];
    [HollerUserDefaults setObject:accessId forKey:HOLLERAccessId];
}

@end
