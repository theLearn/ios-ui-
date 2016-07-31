//
//  UIColorCustom.h
//  learn
//
//  Created by 洪诚 on 16/7/8.
//  Copyright © 2016年 洪诚. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIColor (Custom)

+(UIColor *)getColorByHex:(NSString *) hexColor;
+(UIColor *)getColorByHex:(NSString *) hexColor withAlpha:(CGFloat) alpha;

+(UIColor *)getCommonBackgroundColor;

+(UIColor *)getMainUIColor;
+(UIColor *)getMainUIColor:(CGFloat) alpha;

+(UIColor *)getSmallTextColor;
+(UIColor *)getMidTextColor;
+(UIColor *)getLargeTextColor;

+(UIColor *)getCoverViewColor;

@end
