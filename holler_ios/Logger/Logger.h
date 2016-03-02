//
//  Logger.h
//  PL
//
//  Created by Le Duy Phong on 2/1/13.
//  Copyright (c) 2013 PL. All rights reserved.
//
#import <Foundation/Foundation.h>

#ifdef DEBUG
#   define DLog(fmt, ...) QuietLog((@"DEBUG %s [Line %d]" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#   define PLLog(fmt, ...) QuietLog((@"DEBUG %s [Line %d]" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#   define CLog() CleanLog()
#else
#   define DLog(fmt, ...)
#   define PLLog(fmt, ...)
#   define CLog() CleanLog()
#endif


//
//#ifdef DEBUG
//#   define DLog(fmt, ...) QuietLog((@"DEBUG %s [Line %d]" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
//#   define PLLog(fmt, ...) QuietLog((@"DEBUG %s [Line %d]" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
//#   define CLog() CleanLog()
//#else
//#   define DLog(fmt, ...) QuietLog((@"DEBUG %s [Line %d]" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
//#   define PLLog(fmt, ...) QuietLog((@"DEBUG %s [Line %d]" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
//#   define CLog(...)
//#endif

#define ALog(fmt, ...) QuietLog((@"MEMORY %s [Line %d]\n" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);


#ifdef DEBUG
#   define ULog(fmt, ...)  { UIAlertView *alertU = [[[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d]", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease]; [alertU show]; }
#else
#   define ULog(...)
#endif

void QuietLog (NSString *format, ...);
void writeLogFile(NSString *msg);
void CleanLog();