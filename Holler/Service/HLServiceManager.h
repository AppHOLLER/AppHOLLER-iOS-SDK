//
//  HLServiceManager.h
//  Holler_iOS_SDK
//
//  Created by Phong Nguyen on 4/14/16.
//  Copyright © 2016 RML. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@class HLMiscellaneous;
@class HLError;

typedef NS_ENUM(NSUInteger, HLHTTPMethod){
    HL_HTTP_POST,
    HL_HTTP_GET,
    HL_HTTP_PUT,
    HL_HTTP_PATCH,
    HL_HTTP_DELETE
};

@interface HLServiceManager : NSObject

+(id)standardManager;

-(void)executeRESTRequestWithCredential: (NSString *)HTTPRequest method: (HLHTTPMethod)method params: (NSDictionary *)params onCompletion: (void (^)(BOOL, NSError*, HLError*, id))completion;
-(void)executeRESTRequestWithCredential: (NSString *)HTTPRequest method: (HLHTTPMethod)method objectId: (NSString *)objectId onCompletion: (void (^)(BOOL, NSError*, HLError*, id))completion;
-(void)executeRESTRequestWithCredential: (NSString *)HTTPRequest method: (HLHTTPMethod)method objectId: (NSString *)objectId params: (NSDictionary *)params onCompletion: (void (^)(BOOL, NSError*, HLError*, id))completion;

-(void)executeRESTRequest: (NSString *)HTTPRequest method: (HLHTTPMethod)method params: (NSDictionary *)params headers: (NSDictionary *)headers onCompletion: (void (^)(BOOL, NSError*, HLError*, id))completion;

-(void)uploadRESTRequest: (NSString *)HTTPRequest method: (NSString *)method data: (NSData *)data params: (NSDictionary *)params headers: (NSDictionary *)headers onCompletion:(void (^)(BOOL, NSError*, HLError*, id))completion;
-(void)uploadRESTRequestWithCredential: (NSString *)HTTPRequest method: (HLHTTPMethod)method data: (NSData *)data params: (NSDictionary *)params onCompletion: (void (^)(BOOL, NSError*, HLError*, id))completion;
-(void)uploadRESTRequestWithCredential: (NSString *)HTTPRequest method: (HLHTTPMethod)method data: (NSData *)data objectId: (NSString *)objectId onCompletion: (void (^)(BOOL, NSError*, HLError*, id))completion;

@end
