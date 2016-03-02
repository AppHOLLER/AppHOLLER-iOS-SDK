//
//  Logger.m
//  PL
//
//  Created by Le Duy Phong on 2/1/13.
//  Copyright (c) 2013 TMA. All rights reserved.
//

#import "Logger.h"

void QuietLog (NSString *format, ...)
{
    if (format == nil)
    {
        printf("nil\n");
        return;
    }
    
    va_list argList;
    va_start(argList, format);
    //format = [format stringByAppendingString:@"\n\n"];
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat:@"dd/mm/yyyy HH:mm:ss:"];
    
    NSString *s = [[NSString alloc] initWithFormat:format arguments:argList];
     
    NSString *msg = [NSString stringWithFormat:@"%s %s\n\n\n",  [[timeFormat stringFromDate:[NSDate date]] UTF8String], [[s stringByReplacingOccurrencesOfString:@"%%" withString:@"%%%%"] UTF8String]];
    
    printf("%s %s\n\n\n",  [[timeFormat stringFromDate:[NSDate date]] UTF8String], [[s stringByReplacingOccurrencesOfString:@"%%" withString:@"%%%%"] UTF8String]);
    
    
    writeLogFile(msg);
    va_end(argList);
}

void writeLogFile(NSString *msg){
    // get path to Documents/somefile.txt
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"logfile.txt"];
    // create if needed
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]){
        fprintf(stderr,"Creating file at %s",[path UTF8String]);
        [[NSData data] writeToFile:path atomically:YES];
    }
    
    // append
    NSFileHandle *handle = [NSFileHandle fileHandleForWritingAtPath:path];
    [handle truncateFileAtOffset:[handle seekToEndOfFile]];
    [handle writeData:[msg dataUsingEncoding:NSUTF8StringEncoding]];
    [handle closeFile];
    
    
    
}

void CleanLog()
{
    // get path to Documents/somefile.txt
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"logfile.txt"];
    // create if needed
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]){
        fprintf(stderr,"Creating file at %s",[path UTF8String]);
        [[NSData data] writeToFile:path atomically:YES];
    }
}