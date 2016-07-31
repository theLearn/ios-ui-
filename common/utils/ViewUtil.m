//
//  ViewUtil.m
//  learn
//
//  Created by 洪诚 on 16/7/7.
//  Copyright © 2016年 洪诚. All rights reserved.
//

#import "ViewUtil.h"
#import "UIKit/UIGraphics.h"

@implementation ViewUtil

static ViewUtil *instance;

+(instancetype)getInstance
{
    if(instance == nil)
    {
        instance = [[ViewUtil alloc] init];
    }
    
    return instance;
}

+(CGSize)calculateSizeByContent:(NSString *) content FontSize:(CGFloat)size
{
    return [ViewUtil calculateSizeByContent:content andFont:[UIFont systemFontOfSize:size]];
}

+(CGSize)calculateSizeByContent:(NSString *) content FontSize:(CGFloat)size withMax:(CGFloat)max
{
        return [ViewUtil calculateSizeByContent:content andFont:[UIFont systemFontOfSize:size] withMax:max];
}

+(CGSize)calculateSizeByContent:(NSString *) content andFont:(UIFont *)font
{
    return [ViewUtil calculateSizeByContent:content andFont:font isAllowNewLine:NO];
}

+(CGSize)calculateSizeByContent:(NSString *) content andFont:(UIFont *)font withMax:(CGFloat)max
{
    return [ViewUtil calculateSizeByContent:content andFont:font withMax:max isAllowNewLine:NO];
}

+(CGSize)calculateSizeByContent:(NSString *) content andFont:(UIFont *)font isAllowNewLine:(BOOL) isAllow
{
    CGFloat height = 0;
    if(isAllow)
    {
        height = MAXFLOAT;
    }
    //高度固定不折行
    CGRect tmpRect = [content boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil] context:nil];
    
    return tmpRect.size;
}

+(CGSize)calculateSizeByContent:(NSString *) content andFont:(UIFont *)font withMax:(CGFloat)max isAllowNewLine:(BOOL) isAllow
{
    CGFloat height = 0;
    if(isAllow)
    {
        height = MAXFLOAT;
    }
    //高度固定不折行
    CGRect tmpRect = [content boundingRectWithSize:CGSizeMake(max, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil] context:nil];
    
    return tmpRect.size;
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

-(void)showWaiting:(UIViewController *)vc
{
    if(!waitView)
    {
        waitView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, vc.view.frame.size.width, vc.view.frame.size.height)];
        waitView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.25];
        UIActivityIndicatorView *activityIndicatorView =[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [waitView addSubview:activityIndicatorView];
    }
    else
    {
        waitView.alpha = 1.0;
    }

    waitView.subviews.firstObject.frame = CGRectMake(vc.view.frame.size.width/2, vc.view.frame.size.height/2, 10, 10);
    
    [waitView.subviews.firstObject startAnimating];
    
    UITapGestureRecognizer *press = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(stopWaiting)];
    [waitView addGestureRecognizer:press];
    
    [vc.view addSubview:waitView];
}

-(void)stopWaiting
{
    if(waitView)
    {
        waitView.alpha = 0.0;
        [waitView removeFromSuperview];
    }
}

@end
