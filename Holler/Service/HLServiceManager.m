//
//  HLServiceManager.m
//  Holler_iOS_SDK
//
//  Created by Phong Nguyen on 4/14/16.
//  Copyright © 2016 RML. All rights reserved.
//

#import "HLServiceManager.h"

#import <Holler/HLMiscellaneous.h>
#import <Holler/HLError.h>

#define HOLLER_HTTP_TIMEOUT                     2.5f

@interface HLServiceManager()

@property(atomic) dispatch_queue_t asyncQueue;
@property(atomic) dispatch_queue_t syncQueue;

@property(atomic, strong) AFNetworkReachabilityManager *networkingManager;

@end

@implementation HLServiceManager

@synthesize networkingManager;

+(id)standardManager{
    static dispatch_once_t onceToken;
    static HLServiceManager *manager;
    
    dispatch_once(&onceToken, ^{
        manager = [[HLServiceManager alloc] init];
        manager.networkingManager = [AFNetworkReachabilityManager sharedManager];
        
        //queuing initialisation
        manager.asyncQueue = dispatch_queue_create("HL_QUEUE_SERVE_ASYNCHRONOUS", NULL);
        manager.syncQueue = dispatch_queue_create("HL_QUEUE_SERVE_SYNCHRONOUS", NULL);
    });
    
    return manager;
}

-(void)executeRESTRequestWithCredential:(NSString *)HTTPRequest method:(HLHTTPMethod)method params:(NSDictionary *)params onCompletion:(nullable void (^)(BOOL, NSError*, HLError*, id))completion{
    [self executeRESTRequest:[HLMiscellaneous perceiveAPI:HTTPRequest] method:method params:params headers:[HLMiscellaneous perceiveHeaderCredential] onCompletion:completion];
}

-(void)executeRESTRequestWithCredential:(NSString *)HTTPRequest method:(HLHTTPMethod)method objectId:(NSString *)objectId onCompletion:(void (^)(BOOL, NSError*, HLError*, id))completion{
    NSString *URLWithObjectId = [NSString stringWithFormat:[HLMiscellaneous perceiveAPI:HTTPRequest], objectId];
    [self executeRESTRequest:URLWithObjectId method:method params:nil headers:[HLMiscellaneous perceiveHeaderCredential] onCompletion:completion];
}

-(void)executeRESTRequestWithCredential:(NSString *)HTTPRequest method:(HLHTTPMethod)method objectId:(NSString *)objectId params:(NSDictionary *)params onCompletion:(void (^)(BOOL, NSError*, HLError*, id))completion{
    NSString *URLWithObjectId;
    
    if(objectId){
        URLWithObjectId = [NSString stringWithFormat:[HLMiscellaneous perceiveAPI:HTTPRequest], objectId];
    }else{
        URLWithObjectId = [HLMiscellaneous perceiveAPI:HTTPRequest];
    }
    
    [self executeRESTRequest:URLWithObjectId method:method params:params headers:[HLMiscellaneous perceiveHeaderCredential] onCompletion:completion];
}

-(void)executeRESTRequest:(NSString *)HTTPRequest method:(HLHTTPMethod)method params:(NSDictionary *)params headers:(NSDictionary *)headers onCompletion:(void (^)(BOOL, NSError*, HLError*, id))completion{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *sessionManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSMutableURLRequest *request;
    
    request = [[AFJSONRequestSerializer serializer] requestWithMethod:[self identifyHTTPMethod:method] URLString:HTTPRequest parameters:params error:nil];
    [self iterateHeaderRespectively:request headers:headers];
    
    NSURLSessionDataTask *dataTask = [sessionManager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error){
        if(error){
            completion(NO, error, [[HLError alloc] initWithJsonData:responseObject],nil);
        }else{
            completion(YES, nil, nil, responseObject);
        }
    }];
    
    [dataTask resume];
}

-(void)uploadRESTRequest:(NSString *)HTTPRequest method: (NSString *)method data: (NSData *)data params:(NSDictionary *)params headers:(NSDictionary *)headers onCompletion:(void (^)(BOOL, NSError*, HLError*, id))completion{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *sessionManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:HTTPRequest] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:HOLLER_HTTP_TIMEOUT];
    request.HTTPMethod = method;
    [self iterateHeaderRespectively:request headers:headers];
    
    NSURLSessionUploadTask *uploadTask = [sessionManager uploadTaskWithRequest:request fromData:data progress:nil completionHandler:^(NSURLResponse *response, id responseObject, NSError *error){
        if(error){
            completion(NO, error, [[HLError alloc] initWithJsonData:responseObject], nil);
        }else{
            completion(YES, nil, nil, responseObject);
        }
    }];
    
    [uploadTask resume];
}

-(void)uploadRESTRequestWithCredential:(NSString *)HTTPRequest method: (HLHTTPMethod)method data: (NSData *)data objectId:(NSString *)objectId onCompletion:(void (^)(BOOL, NSError*, HLError*, id))completion{
    NSString *URLWithObjectId = [NSString stringWithFormat:[HLMiscellaneous perceiveAPI:HTTPRequest], objectId];
    [self uploadRESTRequest:URLWithObjectId method:[self identifyHTTPMethod:method] data:data params:nil headers:[HLMiscellaneous perceiveHeaderCredential] onCompletion:completion];
}

-(void)uploadRESTRequestWithCredential:(NSString *)HTTPRequest method: (HLHTTPMethod)method data: (NSData *)data params:(NSDictionary *)params onCompletion:(void (^)(BOOL, NSError*, HLError*, id))completion{
    [self uploadRESTRequest:[HLMiscellaneous perceiveAPI:HTTPRequest] method:[self identifyHTTPMethod:method] data:data params:params headers:[HLMiscellaneous perceiveHeaderCredential] onCompletion:completion];
}


#pragma mark - Iteration
-(void)iterateHeaderRespectively: (NSMutableURLRequest *)requestURL headers: (NSDictionary *)headers{
    for(NSString *key in headers.allKeys){
        [requestURL setValue:[headers objectForKey:key] forHTTPHeaderField:key];
    }
}

-(NSString *)identifyHTTPMethod: (HLHTTPMethod)method{
    switch (method) {
        case HL_HTTP_GET:
            return @"GET";
            break;
            
        case HL_HTTP_PATCH:
            return @"PATCH";
            break;
            
        case HL_HTTP_POST:
            return @"POST";
            break;
            
        case HL_HTTP_PUT:
            return @"PUT";
            break;
            
        case HL_HTTP_DELETE:
            return @"DELETE";
            break;
            
        default:
            break;
    }
}

@end
