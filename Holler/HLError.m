//
//  HLError.m
//  Holler_iOS_SDK
//
//  Created by Phong Nguyen on 4/19/16.
//  Copyright © 2016 RML. All rights reserved.
//

#import "HLError.h"

#import <Holler/HLConstants.h>

@implementation HLError

-(instancetype)init{
    self = [super init];
    if(self){
        //intialisation phrase
    }
    
    return self;
}

-(instancetype)initWithJsonData:(NSDictionary *)jsonData{
    self = [super init];
    if(self){
        //intialisation phrase
        self->_errorCode = [self identifyErrorCode:[jsonData[ERROR_STATUS_CODE] integerValue]];
        self->_errorStatus = [NSNumber numberWithBool:[jsonData[ERROR_BOOLEAN] boolValue]];
        self->_errorDescription = jsonData[ERROR_DETAIL];
    }
    return self;
}

#pragma mark - Iteration
-(HLHTTPErrorCode)identifyErrorCode: (NSUInteger)errorCode{
    switch (errorCode) {
        case 500:
            return HL_SERVER_ERROR;
            break;
            
        case 400:
            return HL_REQUEST_BAD;
            break;
            
        case 404:
            return HL_REQUEST_NOT_FOUND;
            break;
            
        case 402:
            return HL_REQUEST_PAYMENT_REQUIRED;
            break;
            
        case 401:
            return HL_REQUEST_UNAUTHORISED;
            break;
            
        case 403:
            return HL_REQUEST_FORBIDDEN;
            break;
            
        default:
            break;
    }
    
    return HL_REQUEST_ERROR_UNDEFINED;
}

@end
