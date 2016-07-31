//
//  ViewUtil.h
//  learn
//
//  Created by 洪诚 on 16/7/7.
//  Copyright © 2016年 洪诚. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ViewUtil : NSObject

{
    UIView *waitView;
}

+(instancetype)getInstance;

+(CGSize)calculateSizeByContent:(NSString *) content FontSize:(CGFloat)size;
+(CGSize)calculateSizeByContent:(NSString *) content FontSize:(CGFloat)size withMax:(CGFloat)max;

+(CGSize)calculateSizeByContent:(NSString *) content andFont:(UIFont *)font;
+(CGSize)calculateSizeByContent:(NSString *) content andFont:(UIFont *)font withMax:(CGFloat)max;

+(CGSize)calculateSizeByContent:(NSString *) content andFont:(UIFont *)font isAllowNewLine:(BOOL) isAllow;
+(CGSize)calculateSizeByContent:(NSString *) content andFont:(UIFont *)font withMax:(CGFloat)max isAllowNewLine:(BOOL) isAllow;

+ (UIImage *)imageWithColor:(UIColor *)color;

-(void)showWaiting:(UIViewController *)vc;
-(void)stopWaiting;


@end
