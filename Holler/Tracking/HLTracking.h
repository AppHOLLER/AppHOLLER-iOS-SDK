//
//  HLTracking.h
//  Holler_iOS_SDK
//
//  Created by Phong Nguyen on 4/18/16.
//  Copyright © 2016 RML. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const deviceOS;
extern NSString *const trackedRemark;

@interface HLTracking : NSObject

//Usage tracking
+(void)openedUsageTrackingFromNow;
+(void)closedUsageTrackingFromNow;


@end
