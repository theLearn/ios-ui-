//
//  DateUtil.m
//  learn
//
//  Created by 洪诚 on 16/7/30.
//  Copyright © 2016年 洪诚. All rights reserved.
//

#import "DateUtil.h"

static double sTimeOffWithServer = 0;

@implementation DateUtil

+(double)getLocalTimeWithSec
{
    return [[NSDate date]timeIntervalSince1970];
}

+(double)getLocalTimeWithMSec
{
    return [self getCurrentTimeWithSec] * 1000;
}

+(void)setTimeOffsetWithServer:(double) serverTime
{
    sTimeOffWithServer = serverTime - [self getLocalTimeWithSec];
}

+(double)getCurrentTimeWithSec
{
    return [self getLocalTimeWithSec] + sTimeOffWithServer;
}

+(double)getCurrentTimeWithMSec
{
    return [self getLocalTimeWithMSec] + sTimeOffWithServer;
}

+(NSString *)getCurrentDate
{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [dateFormatter stringFromDate:[NSDate date]];
}

@end
