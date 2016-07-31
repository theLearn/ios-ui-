//
//  StringUtil.m
//  learn
//
//  Created by 洪诚 on 16/7/30.
//  Copyright © 2016年 洪诚. All rights reserved.
//

#import "StringUtil.h"

@implementation StringUtil

+(BOOL) isEmpty:(NSString *)string
{
    if (string == nil || string == NULL)
    {
        return YES;
    }
    
    if ([string isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0)
    {
        return YES;
    }
    return NO;
}

+(BOOL) isValidNum:(NSString *)num
{
    const char *cvalue = [num UTF8String];
    int len = (int)strlen(cvalue);
    for (int i = 0; i < len; i++) {
        if(cvalue[i] < '0' || cvalue[i] > '9'){
            return NO;
        }
    }
    return YES;
}

+(BOOL) isValidPhone:(NSString *)num
{
    if (!num) {
        return NO;
    }
    const char *cvalue = [num UTF8String];
    int len = (int)strlen(cvalue);
    if (len != 11) {
        return NO;
    }
    if (![StringUtil isValidNum:num])
    {
        return NO;
    }
    NSString *preString = [[NSString stringWithFormat:@"%@",num] substringToIndex:2];
    if ([preString isEqualToString:@"13"] ||
        [preString isEqualToString: @"15"] ||
        [preString isEqualToString: @"18"] ||
        [preString isEqualToString: @"17"])
    {
        return YES;
    }
    else
    {
        return NO;
    }
    return YES;
}

+ (BOOL) isValidEmail:(NSString *)email
{
    if (!email) {
        return NO;
    }
    NSArray *array = [email componentsSeparatedByString:@"."];
    if ([array count] >= 4) {
        return NO;
    }
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

@end
