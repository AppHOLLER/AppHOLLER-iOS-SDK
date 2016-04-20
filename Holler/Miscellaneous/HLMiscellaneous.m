//
//  HLError.m
//  Holler_iOS_SDK
//
//  Created by Phong Nguyen on 4/14/16.
//  Copyright © 2016 RML. All rights reserved.
//

#import "HLMiscellaneous.h"

#import <Holler/HLSubscriber.h>
#import <Holler/HLConstants.h>

@interface HLMiscellaneous()

@end

@implementation HLMiscellaneous

+(NSString *)perceiveAPI:(NSString *)request{
#ifdef DEBUG
    return [NSString stringWithFormat:@"%@%@", HOLLER_DEBUG, request];
#elif STAGING
    return [NSString stringWithFormat:@"%@%@", HOLLER_STAGING, request];
#else
    return [NSString stringWithFormat:@"%@%@", HOLLER_LIVED, request];
#endif
}

+(NSDictionary *)perceiveHeaderCredential{
    return @{@"HOLLER-APP-ID" : [HollerUserDefaults objectForKey:HOLLERAppId],
             @"Holler-Access-Key" : [HollerUserDefaults objectForKey:HOLLERAccessId]
             };
}

+(NSDictionary *)perceiveParams:(NSArray *)keys paramValues:(NSArray *)values{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    for(NSString *key in keys){
        [params setObject:[values objectAtIndex:[keys indexOfObject:key]] forKey:key];
    }
    
    return [NSDictionary dictionaryWithDictionary:params];
}

+(BOOL)perceiveDeviceToken:(NSData *)deviceToken{
    if(deviceToken){
        [HollerUserDefaults setObject:[HLMiscellaneous deviceTokenForData:deviceToken] forKey:HLDeviceToken];
        return YES;
    }else{
        return NO;
    }
}


#pragma mark - Subscriber Manipulation
+(NSDictionary *)deserialiseSubscriber: (HLSubscriber*)subscriber{
    return @{SUBSCRIBER_USERNAME: subscriber.subscriberUsername,
             SUBSCRIBER_DEVICE_TOKEN: [HollerUserDefaults objectForKey:HLDeviceToken],
             SUBSCRIBER_DEVICE_TYPE: @"ios",
             SUBSCRIBER_EMAIL_ADDRESS: subscriber.subscriberEmail,
             SUBSCRIBER_FIRSTNAME: subscriber.subscriberFirstName,
             SUBSCRIBER_LASTNAME: subscriber.subscriberLastName,
             SUBSCRIBER_CELLPHONE_NUMBER: subscriber.subscriberCellphoneNumber,
             SUBSCRIBER_INFORMATION: subscriber.subscriberInformations};
}

+(NSData *)deserialiseSubscriberToData:(HLSubscriber *)subscriber error:(NSError *__autoreleasing *)error{
    NSDictionary *subscriberJson = [HLMiscellaneous deserialiseSubscriber:subscriber];
    return [NSJSONSerialization dataWithJSONObject:subscriberJson options:NSJSONWritingPrettyPrinted error:error];
}


#pragma mark - Device token Manipulation
+(NSString *)deviceTokenForData:(NSData *)data{
    return [[[[data description] stringByReplacingOccurrencesOfString: @"<" withString: @""] stringByReplacingOccurrencesOfString: @">" withString: @""] stringByReplacingOccurrencesOfString: @" " withString: @""];
}


#pragma mark - Push Notification Manipulation
+(NSString *)detachCommunicationIdFromPayload:(NSDictionary *)payload{
    if(payload[HL_PUSH_APS][HL_PUSH_ALERT]){
        NSString *communicationId = payload[HL_PUSH_CUSTOM][HL_PUSH_DATA_A][HL_PUSH_COMMUNICATION_ID];
        if(communicationId){
            return communicationId;
        }else{
            return nil;
        }
    }
    return nil;
}

+(NSDictionary *)serialisePushNotificationReceivedFromPayload:(NSDictionary *)payload{
    return @{SUBSCRIBER_DEVICE_TOKEN: [HollerUserDefaults objectForKey:HLDeviceToken],
             SUBSCRIBER_DEVICE_TYPE: @"ios",
             HL_PUSH_COMMUNICATION_ID: [HLMiscellaneous detachCommunicationIdFromPayload:payload]};
}

@end

