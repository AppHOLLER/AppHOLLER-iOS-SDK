//
//  HLTarget.h
//  Holler_iOS_SDK
//
//  Created by Phong Nguyen on 4/14/16.
//  Copyright © 2016 RML. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import <Holler/HLError.h>

typedef NS_ENUM(NSInteger, HLTargetType){
    HLTargetIsIndustry,
    HLTargetIsInterest,
    HLTargetIsDesignation,
    HLTargetIsCountry,
    HLTargetIsLocation,
    HLTargetIsGender,
    HLTargetIsDevice,
    HLTargetIsUndefined
};

@interface HLTarget : NSObject

//Target Common specification
@property(atomic, nonnull, readonly) NSNumber *targetId;

//Industry, Interest specifification
@property(nonatomic, nullable, weak) NSString *targetIndustryName;
@property(nonatomic, nullable, weak) NSString *targetInterestName;
@property(nonatomic, nullable, weak) NSString *targetDesignatioName;

@property(nonatomic, weak) NSString *targetApplicationId;
@property(nonatomic, weak) NSNumber *targetIsPublished;

//Country, Gender specification
@property(nonatomic, nullable, weak) NSString *targetName;
@property(nonatomic, nullable, weak) NSString *targetKey;

//Location specification
@property(nonatomic, nullable, weak) NSString *targetLocatioName;
@property(nonatomic, assign) CLLocationCoordinate2D targetLocationCoordinate;
@property(nonatomic, nullable, weak) NSNumber *targetLocationRadius;

-(nonnull)init;
-(nonnull id)initWithJsonData: (nonnull NSDictionary *)jsonData;
-(nonnull NSArray *)iterateWithJsonData: (nonnull NSDictionary *)jsonData;

+(void)fetchListDeviceOnCompletion: (nonnull void (^)(BOOL, NSError* _Nullable, HLError* _Nullable, NSArray* _Nullable))completion;
+(void)fetchListGenderOnCompletion: (nonnull void (^)(BOOL, NSError* _Nullable, HLError* _Nullable, NSArray* _Nullable))completion;
+(void)fetchListCountryOnCompletion: (nonnull void (^)(BOOL, NSError* _Nullable, HLError* _Nullable, NSArray* _Nullable))completion;
+(void)fetchListLocationOnCompletion: (nonnull void (^)(BOOL, NSError* _Nullable, HLError* _Nullable, NSArray* _Nullable))completion;
+(void)fetchListDesignationOnCompletion: (nonnull void (^)(BOOL, NSError* _Nullable, HLError* _Nullable, NSArray* _Nullable))completion;
+(void)fetchListInterestOnCompletion: (nonnull void (^)(BOOL, NSError* _Nullable, HLError* _Nullable, NSArray* _Nullable))completion;
+(void)fetchListIndustryOnCompletion: (nonnull void (^)(BOOL, NSError* _Nullable, HLError* _Nullable, NSArray* _Nullable))completion;

@end
