//
//  HLTaskExecutor.h
//  Holler_iOS_SDK
//
//  Created by Phong Nguyen on 4/14/16.
//  Copyright © 2016 RML. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HLTaskExecutor : NSObject

+(instancetype)defaultExecutor;
+(instancetype)mainThreadExecutor;
+(instancetype)immediateExecutor;
+(instancetype)executorForBlock: (void(^)(void (^block)()))block;
+(instancetype)executorForDispatchQueue: (dispatch_queue_t)dispatchQueue;
+(instancetype)executorForOperationQueue: (NSOperationQueue *)operationQueue;
+(instancetype)execute: (void(^)())block;

@end

NS_ASSUME_NONNULL_END