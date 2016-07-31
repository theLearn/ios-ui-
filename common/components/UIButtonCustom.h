//
//  UIButtonCustom.h
//  learn
//
//  Created by 洪诚 on 16/7/10.
//  Copyright © 2016年 洪诚. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIButton (Custom)

-(void)build:(NSString *) content;

-(void)build:(NSString *) content FontSize:(CGFloat) size;

-(void)build:(UIColor *) normal WithPressedColor:(UIColor *) press FontSize:(CGFloat) size;

-(void)build:(UIImage *) normal WithPressedImg:(UIImage *) press FontSize:(CGFloat) size;

-(void)setBackground:(UIColor *) normal WithPressedColor:(UIColor *) press;

-(void)setBackground:(UIImage *) normal WithPressedImg:(UIImage *) press;

-(void)setBackground:(NSString *) normalPath WithPressedPath:(NSString *) pressPath;

-(void)setBackgroundColor:(UIColor *) backgroundColor ForSate:(UIControlState) state;
@end
