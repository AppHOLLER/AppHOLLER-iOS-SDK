//
//  HLApplication.h
//  Holler_iOS_SDK
//
//  Created by Phong Nguyen on 4/14/16.
//  Copyright © 2016 RML. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Holler/HLError.h>

typedef NS_ENUM(NSInteger, HLAPNSEnvironmentMode){
    HLAPNSENVSANDBOX,
    HLAPNSENVPRODUCTION
};

@interface HLApplication : NSObject

@property(nonnull, atomic, readonly) NSNumber *applicationId;
@property(nonnull, nonatomic, readonly) NSString *applicationName;
@property(nonnull, readonly) NSString *applicationAccessId;
@property(nullable, nonatomic, readonly) NSString *applicationDescription;
@property(nullable, nonatomic, readonly) NSString *applicationAPNsFile;
@property(nullable, nonatomic, readonly) NSString *applicationGCMCredential;
@property(nonnull, nonatomic, readonly) NSTimeZone *applicationTimeZone;
@property(nonnull, nonatomic, readonly) NSObject *applicationLogoImage;
@property(nonatomic, readonly) HLAPNSEnvironmentMode applicationAPNSEnv;
@property(nonnull, nonatomic, readonly) NSDate *applicationCreatedDate;
@property(nonatomic, nonnull, readonly) NSDate *applicationUpdatedDate;
@property(nonatomic, nonnull, readonly) NSNumber *applicationIsDemoable;

-(nonnull instancetype)initWithJsonData: (nonnull NSDictionary *)jsonData;

+(void)fetchApplicationById: (nonnull NSString *)applicationId onCompletion: (nonnull void (^)(BOOL, NSError * _Nullable, HLError * _Nullable, HLApplication *_Nullable))completion;

@end
