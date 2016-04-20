//
//  HLError.h
//  Holler_iOS_SDK
//
//  Created by Phong Nguyen on 4/14/16.
//  Copyright © 2016 RML. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum Error: NSUInteger {
    HL_SERVER_ERROR = 500,
    HL_REQUEST_SUCCEED = 200,
    HL_REQUEST_FAILED,
    HL_REQUEST_FORBIDDEN,
    HL_REQUEST_ERROR_UNDEFINED
} HollerError;


extern NSString *const HollerServiceURLDebug;

extern NSString *const HollerServiceURLStaging;

extern NSString *const HollerServiceURLLived;

