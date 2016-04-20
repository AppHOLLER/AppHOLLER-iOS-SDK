//
//  HLUtility.m
//  Holler_iOS_SDK
//
//  Created by Phong Nguyen on 4/15/16.
//  Copyright © 2016 RML. All rights reserved.
//

#import "HLUtility.h"

@implementation HLUtility

+(NSDate *)conformDateToFormat:(NSString *)date format:(NSString *)format{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    return [dateFormatter dateFromString:date];
}

+(NSDate *)conformDateToHOLLERFormat:(NSString *)date{
    return [HLUtility conformDateToFormat:date format:@"YYYY-mm-DDTGG:ii:ss.ZZZZZZ"];
}

@end
