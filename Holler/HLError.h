//
//  HLError.h
//  Holler_iOS_SDK
//
//  Created by Phong Nguyen on 4/19/16.
//  Copyright © 2016 RML. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, HLHTTPErrorCode){
    HL_SERVER_ERROR = 500,
    HL_REQUEST_SUCCEED = 200,
    HL_REQUEST_NOT_FOUND = 404,
    HL_REQUEST_FORBIDDEN = 403,
    HL_REQUEST_PAYMENT_REQUIRED = 402,
    HL_REQUEST_UNAUTHORISED = 401,
    HL_REQUEST_BAD = 400,
    HL_REQUEST_ERROR_UNDEFINED
};

@interface HLError : NSObject

@property(nonatomic, readonly) HLHTTPErrorCode errorCode;
@property(nonatomic, nullable, readonly) NSDictionary *errorDescription;
@property(nonatomic, nonnull, readonly) NSNumber *errorStatus;

-(nonnull instancetype)init;
-(nonnull instancetype)initWithJsonData: (nonnull NSDictionary *)jsonData;

@end
