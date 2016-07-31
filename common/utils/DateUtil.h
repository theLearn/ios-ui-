//
//  DateUtil.h
//  learn
//
//  Created by 洪诚 on 16/7/30.
//  Copyright © 2016年 洪诚. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateUtil : NSObject

+(NSString *)getCurrentDate;
+(double)getLocalTimeWithSec;//获取本地时间，单位：s
+(double)getLocalTimeWithMSec;//获取本地时间，单位：ms
+(double)getCurrentTimeWithSec;//获取服务器时间，单位：s
+(double)getCurrentTimeWithMSec;//获取服务器时间，单位：ms
+(void)setTimeOffsetWithServer:(double) serverTime;////调整时间差，需要在调用服务器接口时获取到服务器时间后调用

@end
