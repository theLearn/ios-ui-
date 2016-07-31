//
//  AppInfoUtil.m
//  learn
//
//  Created by 洪诚 on 16/7/30.
//  Copyright © 2016年 洪诚. All rights reserved.
//

#import "AppInfoUtil.h"

@implementation AppInfoUtil

//这个函数是从网上找的代码，不是很准确，使用的方法也奇怪，这里只是表示一个意思，可令getClientInfo调用。
//想要更正确的代码，请自行查找。
+ (NSString *)getDeviceName
{
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    
    //get current interface Orientation
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    //unknown
    if (UIInterfaceOrientationUnknown == orientation) {
        return @"unknown";
    }
    
    //    portrait  width * height
    //    iPhone4:320*480
    //    iPhone5:320*568
    //    iPhone6:375*667
    //    iPhone6Plus:414*736
    
    //portrait
    if (UIInterfaceOrientationPortrait == orientation) {
        if (width ==  320.0f) {
            if (height == 480.0f) {
                return @"iphone4/iPhone4s";//iphone4
            } else {
                return @"iPhone5/iPhone5s";
            }
        } else if (width == 375.0f) {
            return @"iPhone6/iPhone6s";
        } else if (width == 414.0f) {
            return @"iPhone6plus/iPhone6sPlus";
        }
    } else if (UIInterfaceOrientationLandscapeLeft == orientation || UIInterfaceOrientationLandscapeRight == orientation) {//landscape
        if (height == 320.0) {
            if (width == 480.0f) {
                return @"iphone4/iPhone4s";
            } else {
                return @"iPhone5/iPhone5s";
            }
        } else if (height == 375.0f) {
            return @"iPhone6/iPhone6s";
        } else if (height == 414.0f) {
            return @"iPhone6plus/iPhone6sPlus";
        }
    }
    return @"-1";
}
//获取设备信息
+(NSString *)getPhoneInfo
{
    NSMutableString *ret = [[NSMutableString alloc]init];
    [ret appendString:@"os:iphone"];
    [ret appendFormat:@",osVersion:%f", [[[UIDevice currentDevice] systemVersion] floatValue]];
    [ret appendString:@",phoneBrand:iphone"];
    [ret appendFormat:@",phoneModel:%@", [self getDeviceName]];
    [ret appendFormat:@",appVersionName:%@", [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]];
    [ret appendFormat:@",appVersionCode:%@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]];
    NSString * adId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    NSString * deviceId = [[UIDevice currentDevice].identifierForVendor UUIDString];
    [ret appendFormat:@",deviceId:%@", deviceId];
    NSString *identifier = nil;
    if(!adId){
        identifier = deviceId;
    }else{
        identifier = adId;
        [ret appendFormat:@",adId:%@", adId];
    }
    [ret appendFormat:@",uuid:%@", identifier];
    return ret;
}

@end
