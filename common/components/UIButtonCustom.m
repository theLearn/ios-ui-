//
//  UIButtonCustom.m
//  learn
//
//  Created by 洪诚 on 16/7/10.
//  Copyright © 2016年 洪诚. All rights reserved.
//

#import "UIButtonCustom.h"
#import "Dimen.h"
#import "UIColorCustom.h"
#import "ViewUtil.h"

@implementation UIButton (Custom)

-(void)build:(NSString *) content
{
    [self build:content FontSize:MIDDLE_TEXT];
}

-(void)build:(NSString *) content FontSize:(CGFloat) size
{
    [self setTitle:content forState:UIControlStateNormal];
    
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor getMainUIColor] forState:UIControlStateHighlighted];
    
    [self build:[UIColor getMainUIColor] WithPressedColor:[UIColor getMainUIColor:0.88] FontSize:size];
}

-(void)build:(UIColor *) normal WithPressedColor:(UIColor *) press FontSize:(CGFloat) size
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius=8.0f;
    
    [self.titleLabel setFont:[UIFont systemFontOfSize:size]];
    [self setBackground:normal WithPressedColor:press];
}

-(void)build:(UIImage *) normal WithPressedImg:(UIImage *) press FontSize:(CGFloat) size
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius=8.0f;
    
    [self.titleLabel setFont:[UIFont systemFontOfSize:size]];
    [self setBackground:normal WithPressedImg:press];
}

-(void)setBackground:(UIColor *) normal WithPressedColor:(UIColor *) press
{
    [self setBackgroundColor:normal ForSate:UIControlStateNormal];
    [self setBackgroundColor:press ForSate:UIControlStateHighlighted];
}

-(void)setBackground:(NSString *) normalPath WithPressedPath:(NSString *) pressPath
{
    [self setBackground:[UIImage imageNamed:normalPath] WithPressedImg:[UIImage imageNamed:pressPath]];
}

-(void)setBackground:(UIImage *) normal WithPressedImg:(UIImage *) press
{
    [self setBackgroundImage:normal forState:UIControlStateNormal];
    [self setBackgroundImage:press forState:UIControlStateHighlighted];
}

-(void)setBackgroundColor:(UIColor *) backgroundColor ForSate:(UIControlState) state
{
    [self setBackgroundImage:[ViewUtil imageWithColor:backgroundColor] forState:state];
}


@end
