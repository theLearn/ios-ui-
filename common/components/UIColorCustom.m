//
//  UIColorCustom.m
//  learn
//
//  Created by 洪诚 on 16/7/8.
//  Copyright © 2016年 洪诚. All rights reserved.
//

#import "UIColorCustom.h"

@implementation UIColor (Custom)

+(UIColor *)getColorByHex:(NSString *) hexColor
{
    return [UIColor getColorByHex:hexColor withAlpha:1];
}

+(UIColor *)getColorByHex:(NSString *) hexColor withAlpha:(CGFloat) alpha
{
    if ([hexColor length] <6)
    {
        //长度不合法
        return [UIColor blackColor];
    }
    
    NSString *tempString=[hexColor lowercaseString];
    if ([tempString hasPrefix:@"0x"])
    {
        //检查开头是0x
        tempString = [tempString substringFromIndex:2];
    }
    else if ([tempString hasPrefix:@"#"])
    {
        //检查开头是#
        tempString = [tempString substringFromIndex:1];
    }
    
    if ([tempString length] !=6)
    {
        return [UIColor blackColor];
    }
    
    //分解三种颜色的值
    NSRange range;
    range.location =0;
    range.length =2;
    NSString *rString = [tempString substringWithRange:range];
    range.location =2;
    NSString *gString = [tempString substringWithRange:range];
    range.location =4;
    NSString *bString = [tempString substringWithRange:range];
    //取三种颜色值
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString]scanHexInt:&r];
    [[NSScanner scannerWithString:gString]scanHexInt:&g];
    [[NSScanner scannerWithString:bString]scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r /255.0f)
                           green:((float) g /255.0f)
                            blue:((float) b /255.0f)
                           alpha:alpha];
}

+(UIColor *)getCommonBackgroundColor
{
    return [UIColor colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:1
            ];
}

+(UIColor *)getMainUIColor
{
    return [UIColor getColorByHex:@"#00b4e6"];
}

+(UIColor *)getMainUIColor:(CGFloat) alpha
{
    return [UIColor getColorByHex:@"#00b4e6" withAlpha:alpha];
}

+(UIColor *)getSmallTextColor
{
    return [UIColor getColorByHex:@"#8c8c8c"];
}

+(UIColor *)getMidTextColor
{
    return [UIColor getColorByHex:@"#6a6a6a"];
}

+(UIColor *)getLargeTextColor
{
    return [UIColor getColorByHex:@"#333333"];
}

+(UIColor *)getCoverViewColor
{
    return [UIColor colorWithRed:0 green:0 blue:0 alpha:0.25];
}

@end
