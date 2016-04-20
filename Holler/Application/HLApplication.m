//
//  HLApplication.m
//  Holler_iOS_SDK
//
//  Created by Phong Nguyen on 4/14/16.
//  Copyright © 2016 RML. All rights reserved.
//

#import "HLApplication.h"

#import <Holler/HLUtility.h>
#import <Holler/HLConstants.h>
#import <Holler/HLServiceManager.h>

@implementation HLApplication

+(void)fetchApplicationById:(NSString *)applicationId onCompletion:(nonnull void (^)(BOOL, NSError * _Nullable, HLError * _Nullable, HLApplication * _Nullable))completion{
    [[HLServiceManager standardManager] executeRESTRequestWithCredential:HOLLER_SERVICE_GET_APPLICATION method:HL_HTTP_GET objectId:applicationId onCompletion:^(BOOL succeed, NSError *error, HLError *errorObject, id responseObject){
        if(error){
            completion(NO, error, errorObject, nil);
        }else{
            completion(YES, nil, nil, [[HLApplication alloc] initWithJsonData:responseObject]);
        }
    }];
}

-(nonnull instancetype)initWithJsonData: (nonnull NSDictionary *)jsonData{
    self = [super init];
    if(self){
        //initialisation phrase
        
        NSNumber *applicationId = [NSNumber numberWithInt:[jsonData[COMMON_KEY_ID] floatValue]];
        self->_applicationId = [applicationId copy];
        
        self->_applicationName = [jsonData[HOLLER_APP_NAME] copy];
        self->_applicationAccessId = [jsonData[HOLLER_APP_ACESS_ID] copy];
        self->_applicationDescription = [jsonData[HOLLER_APP_DESCRIPTION] copy];
        self->_applicationAPNsFile = [jsonData[HOLLER_APP_APNS_P12][HOLLER_APP_APNS_FILE_NAME] copy];
        self->_applicationAPNSEnv = [self identifyAPNSMode:jsonData[HOLLER_APP_ENV]];
        self->_applicationGCMCredential = [jsonData[HOLLER_APP_GCM_CREDENTIAL] copy];
        
        NSDate *createdDate = [HLUtility conformDateToHOLLERFormat:jsonData[HOLLER_APP_CREATED_DATE]];
        self->_applicationCreatedDate = createdDate;
        
        NSDate *updatedDate = [HLUtility conformDateToHOLLERFormat:jsonData[HOLLER_APP_UPDATED_DATE]];
        self->_applicationUpdatedDate = updatedDate;
        
        NSNumber *isDemoable = [NSNumber numberWithBool:[jsonData[HOLLER_APP_DEMOABLE] boolValue]];
        self->_applicationIsDemoable =  [isDemoable copy];
    }
    return self;
}


#pragma mark - Iteration
-(HLAPNSEnvironmentMode)identifyAPNSMode: (NSString *)mode{
    if([mode isEqualToString:@"sandbox"]){
        return HLAPNSENVSANDBOX;
    }else{
        return HLAPNSENVPRODUCTION;
    }
}

@end
