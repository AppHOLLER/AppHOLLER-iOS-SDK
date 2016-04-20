//
//  HLTarget.m
//  Holler_iOS_SDK
//
//  Created by Phong Nguyen on 4/14/16.
//  Copyright © 2016 RML. All rights reserved.
//

#import "HLTarget.h"

#import <Holler/HLConstants.h>
#import <Holler/HLServiceManager.h>

@implementation HLTarget

#pragma mark - Class Methods
+(void)fetchListCountryOnCompletion:(void (^)(BOOL, NSError * _Nullable, HLError* _Nullable, NSArray * _Nullable))completion{
    [[HLServiceManager standardManager] executeRESTRequestWithCredential:HOLLER_SERVICE_GET_LIST_COUNTRY method:HL_HTTP_GET params:nil onCompletion:^(BOOL succeed, NSError *error, HLError *errorObject, id responseObject){
        if(error){
            completion(NO, error, errorObject, nil);
        }else{
            completion(YES, nil, nil, [[HLTarget alloc] iterateOnTargetKindCountry:responseObject]);
        }
    }];
}

+(void)fetchListDesignationOnCompletion:(void (^)(BOOL, NSError * _Nullable, HLError* _Nullable, NSArray * _Nullable))completion{
    [[HLServiceManager standardManager] executeRESTRequestWithCredential:HOLLER_SERVICE_GET_LIST_DESIGNATION method:HL_HTTP_GET params:nil onCompletion:^(BOOL succeed, NSError *error, HLError *errorObject, id responseObject){
        if(error){
            completion(NO, error, errorObject, nil);
        }else{
            completion(YES, nil, nil, [[HLTarget alloc] iterateOnTargetKindDesignation:responseObject]);
        }
    }];
}

+(void)fetchListGenderOnCompletion:(void (^)(BOOL, NSError * _Nullable, HLError* _Nullable, NSArray * _Nullable))completion{
    [[HLServiceManager standardManager] executeRESTRequestWithCredential:HOLLER_SERVICE_GET_LIST_GENDER method:HL_HTTP_GET params:nil onCompletion:^(BOOL succeed, NSError *error, HLError *errorObject, id responseObject){
        if(error){
            completion(NO, error, errorObject, nil);
        }else{
            completion(YES, nil, nil, [[HLTarget alloc] iterateOnTargetKindGender:responseObject]);
        }
    }];
}

+(void)fetchListIndustryOnCompletion:(void (^)(BOOL, NSError * _Nullable, HLError* _Nullable, NSArray * _Nullable))completion{
    [[HLServiceManager standardManager] executeRESTRequestWithCredential:HOLLER_SERVICE_GET_LIST_INDUSTRY method:HL_HTTP_GET params:nil onCompletion:^(BOOL succeed, NSError *error, HLError *errorObject, id responseObject){
        if(error){
            completion(NO, error, errorObject, nil);
        }else{
            completion(YES, nil, nil, [[HLTarget alloc] iterateOnTargetKindIndustry:responseObject]);
        }
    }];
}

+(void)fetchListInterestOnCompletion:(void (^)(BOOL, NSError * _Nullable, HLError* _Nullable, NSArray * _Nullable))completion{
    [[HLServiceManager standardManager] executeRESTRequestWithCredential:HOLLER_SERVICE_GET_LIST_INTEREST method:HL_HTTP_GET params:nil onCompletion:^(BOOL succeed, NSError *error, HLError *errorObject, id responseObject){
        if(error){
            completion(NO, error, errorObject, nil);
        }else{
            completion(YES, nil, nil, [[HLTarget alloc] iterateOnTargetKindInterest:responseObject]);
        }
    }];
}

+(void)fetchListLocationOnCompletion:(void (^)(BOOL, NSError * _Nullable, HLError* _Nullable, NSArray * _Nullable))completion{
    [[HLServiceManager standardManager] executeRESTRequestWithCredential:HOLLER_SERVICE_GET_LIST_LOCATION method:HL_HTTP_GET params:nil onCompletion:^(BOOL succeed, NSError *error, HLError *errorObject, id responseObject){
        if(error){
            completion(NO, error, errorObject, nil);
        }else{
            completion(YES, nil, nil, [[HLTarget alloc] iterateOnTargetKindLocation:responseObject]);
        }
    }];
}

+(void)fetchListDeviceOnCompletion:(void (^)(BOOL, NSError * _Nullable, HLError* _Nullable, NSArray * _Nullable))completion{
    [[HLServiceManager standardManager] executeRESTRequestWithCredential:HOLLER_SERVICE_GET_LIST_DEVICE method:HL_HTTP_GET params:nil onCompletion:^(BOOL succeed, NSError *error, HLError *errorObject, id responseObject){
        if(error){
            completion(NO, error, errorObject, nil);
        }else{
            completion(YES, nil, nil, [[HLTarget alloc] iterateOnTargetKindLocation:responseObject]);
        }
    }];
}


#pragma mark - Class Life Cycle
-(instancetype)init{
    self = [super init];
    if(self){
        //initialisation phrase
    }
    return self;
}

-(id)initWithJsonData:(NSDictionary *)jsonData{
    self = [super init];
    if(self){
        //initialisation phrase
        
    }
    return self;
}

-(NSArray *)iterateWithJsonData: (NSDictionary *)jsonData{
    NSArray *targets;
    targets = [[NSArray alloc] init];
    
    //identify type of target
    HLTargetType targetType = [self identifyTargetType:jsonData];
    
    switch (targetType) {
        case HLTargetIsDevice:
            targets = [self iterateOnTargetKindIndustry:jsonData];
            break;
            
        case HLTargetIsCountry:
            targets = [self iterateOnTargetKindCountry:jsonData];
            break;
            
        case HLTargetIsDesignation:
            targets = [self iterateOnTargetKindGender:jsonData];
            break;
            
        case HLTargetIsGender:
            targets = [self iterateOnTargetKindGender:jsonData];
            break;
            
        case HLTargetIsIndustry:
            targets = [self iterateOnTargetKindIndustry:jsonData];
            break;
            
        case HLTargetIsInterest:
            targets = [self iterateOnTargetKindInterest:jsonData];
            break;
            
        case HLTargetIsLocation:
            targets = [self iterateOnTargetKindLocation:jsonData];
            break;
            
        default:
            break;
    }
    
    return targets;
}


#pragma mark - Detection

-(HLTargetType)identifyTargetType: (NSDictionary *)jsonData{
    NSString *targetKind = [jsonData objectForKey:[jsonData.allKeys firstObject]];
    
    if(targetKind){
        if([targetKind isEqualToString:TARGET_IS_DEVICE]){
            return HLTargetIsDevice;
        }else if([targetKind isEqualToString:TARGET_IS_COUNTRY]){
            return HLTargetIsCountry;
        }else if([targetKind isEqualToString:TARGET_IS_DESIGNATION]){
            return HLTargetIsDesignation;
        }else if([targetKind isEqualToString:TARGET_IS_GENDER]){
            return HLTargetIsGender;
        }else if([targetKind isEqualToString:TARGET_IS_INDUSTRY]){
            return HLTargetIsIndustry;
        }else if([targetKind isEqualToString:TARGET_IS_INTEREST]){
            return HLTargetIsInterest;
        }else if([targetKind isEqualToString:TARGET_IS_LOCATION]){
            return HLTargetIsLocation;
        }
    }
    return HLTargetIsUndefined;
}


#pragma mark - Iteration Plural

//iteration for Gender, Device and Country Plural
-(NSArray *)iterateOnTargetKindIndustry: (NSDictionary *)jsonData{
    NSDictionary *industries = [jsonData objectForKey:TARGET_IS_INDUSTRY];
    NSMutableArray *industryList = [[NSMutableArray alloc] init];
    
    for(NSDictionary *industry in industries){
        [industryList addObject:[self iterateOnUnmanedIndustryTarget:industry]];
    }
    
    return [[NSArray alloc] initWithArray:industryList];
}

-(NSArray *)iterateOnTargetKindInterest: (NSDictionary *)jsonData{
    NSDictionary *interests = [jsonData objectForKey:TARGET_IS_INTEREST];
    NSMutableArray *interestList = [[NSMutableArray alloc] init];
    
    for(NSDictionary *interest in interests){
        [interestList addObject:[self iterateOnUnmanedInterestTarget:interest]];
    }
         
    return [[NSArray alloc] initWithArray:interestList];
}

-(NSArray *)iterateOnTargetKindDesignation: (NSDictionary *)jsonData{
    NSDictionary *designations = [jsonData objectForKey:TARGET_IS_DESIGNATION];
    NSMutableArray *designationList = [[NSMutableArray alloc] init];
    
    for(NSDictionary *designation in designations){
        [designationList addObject:[self iterateOnUnmanedDesignation:designation]];
    }
    
    return [[NSArray alloc] initWithArray:designationList];
}

-(NSArray *)iterateOnTargetKindLocation: (NSDictionary *)jsonData{
    NSDictionary *locations = [jsonData objectForKey:TARGET_IS_LOCATION];
    NSMutableArray *locationList = [[NSMutableArray alloc] init];
    
    for(NSDictionary *location in locations){
        [locationList addObject:[self iterateOnUnmanedLocationTarget:location]];
    }
    
    return [[NSArray alloc] initWithArray:locationList];
}

-(NSArray *)iterateOnTargetKindGender: (NSDictionary *)jsonData{
    NSDictionary *genders = [jsonData objectForKey:TARGET_IS_GENDER];
    NSMutableArray *genderList = [[NSMutableArray alloc] init];
    
    for(NSDictionary *gender in genders){
        [genderList addObject:[self iterateOnUnmanedTarget:gender]];
    }
    
    return [[NSArray alloc] initWithArray:genderList];
}

-(NSArray *)iterateOnTargetKindCountry: (NSDictionary *)jsonData{
    NSDictionary *countries = [jsonData objectForKey:TARGET_IS_COUNTRY];
    NSMutableArray *countryList = [[NSMutableArray alloc] init];
    
    for(NSDictionary *country in countries){
        [countryList addObject:[self iterateOnUnmanedTarget:country]];
    }
    
    return [[NSArray alloc] initWithArray:countryList];
}

-(NSArray *)iterateOnTargetKindDevice: (NSDictionary *)jsonData{
    NSDictionary *devices = [jsonData objectForKey:TARGET_IS_DEVICE];
    NSMutableArray *deviceList = [[NSMutableArray alloc] init];
    
    for(NSDictionary *device in devices){
        [deviceList addObject:[self iterateOnUnmanedTarget:device]];
    }
    
    return [[NSArray alloc] initWithArray:deviceList];
}


#pragma mark - Iteration Singular
-(HLTarget *)iterateOnUnmanedIndustryTarget: (NSDictionary *)unmanedJson{
    HLTarget *target = [[HLTarget alloc] init];
    
    target->_targetId = [[NSNumber numberWithInt:[[unmanedJson objectForKey:COMMON_KEY_ID] floatValue]] copy];
    
    [target setTargetIndustryName:[unmanedJson objectForKey:TARGET_INDUSTRY_NAME]];
    [target setTargetApplicationId:[unmanedJson objectForKey:TARGET_APPLICATION_ID]];
    [target setTargetIsPublished:[NSNumber numberWithBool:(BOOL)[unmanedJson objectForKey:TARGET_IS_PUBLISHED]]];
    
    return target;
}

//iteration for Gender, Device and Country Singular
-(HLTarget *)iterateOnUnmanedTarget: (NSDictionary *)unmanedJson{
    HLTarget *target = [[HLTarget alloc] init];
    target->_targetId = [[unmanedJson objectForKey:COMMON_KEY_ID] copy];
    
    [target setTargetName:[unmanedJson objectForKey:TARGET_NAME]];
    [target setTargetKey:[unmanedJson objectForKey:TARGET_KEY]];
    
    return target;
}

-(HLTarget *)iterateOnUnmanedInterestTarget: (NSDictionary *)unmanedJson{
    HLTarget *target = [[HLTarget alloc] init];
    target->_targetId = [[NSNumber numberWithInt:[[unmanedJson objectForKey:COMMON_KEY_ID] floatValue]] copy];
    
    [target setTargetInterestName:[unmanedJson objectForKey:TARGET_INTEREST_NAME]];
    [target setTargetApplicationId:[unmanedJson objectForKey:TARGET_APPLICATION_ID]];
    [target setTargetIsPublished:[NSNumber numberWithBool:(BOOL)[unmanedJson objectForKey:TARGET_IS_PUBLISHED]]];
    
    return target;
}

-(HLTarget *)iterateOnUnmanedLocationTarget: (NSDictionary *)unmanedJson{
    HLTarget *target = [[HLTarget alloc] init];
    target->_targetId = [[NSNumber numberWithInt:[[unmanedJson objectForKey:COMMON_KEY_ID] floatValue]] copy];
    
    [target setTargetLocatioName:[unmanedJson objectForKey:TARGET_LOCATION_NAME]];
    [target setTargetApplicationId:[unmanedJson objectForKey:TARGET_APPLICATION_ID]];
    [target setTargetIsPublished:[NSNumber numberWithBool:(BOOL)[unmanedJson objectForKey:TARGET_IS_PUBLISHED]]];
    
    [target setTargetLocationCoordinate:CLLocationCoordinate2DMake([[unmanedJson objectForKey:TARGET_LOCATION_LATITUDE] floatValue],
                                                                   [[unmanedJson objectForKey:TARGET_LOCATION_LONGITUDE] floatValue])];
    
    [target setTargetLocationRadius:[NSNumber numberWithFloat:[[unmanedJson objectForKey:TARGET_LOCATION_RADIUS] floatValue]]];
    
    return target;
}

-(HLTarget *)iterateOnUnmanedDesignation: (NSDictionary *)unmanedJson{
    HLTarget *target = [[HLTarget alloc] init];
    target->_targetId = [[NSNumber numberWithInt:[[unmanedJson objectForKey:COMMON_KEY_ID] floatValue]] copy];
    
    [target setTargetDesignatioName:[unmanedJson objectForKey:TARGET_DESIGNATION_NAME]];
    [target setTargetApplicationId:[unmanedJson objectForKey:TARGET_APPLICATION_ID]];
    [target setTargetIsPublished:[NSNumber numberWithBool:(BOOL)[unmanedJson objectForKey:TARGET_IS_PUBLISHED]]];
    
    return target;
}

@end
