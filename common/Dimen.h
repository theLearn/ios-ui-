//
//  Dimen.h
//  learn
//
//  Created by 洪诚 on 16/7/8.
//  Copyright © 2016年 洪诚. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifndef Dimen_h
#define Dimen_h

//屏幕宽度
#define SCREEN_WIDTH [[UIScreen mainScreen]bounds].size.width
//屏幕高度
#define SCREEN_HEIGHT [[UIScreen mainScreen]bounds].size.height

//状态栏宽度
#define EDITTEXT_HEIGHT [[UIScreen mainScreen]bounds].size.height / 16

//状态栏宽度
#define STATUS_BAR_WIDTH [[UIApplication sharedApplication] statusBarFrame].size.width
//状态栏高度
#define STATUS_BAR_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height

//常用大小
#define SMALLER_COMMON 3
#define SMALL_COMMON 5
#define MIDER_COMMON 8
#define MID_COMMON 10
#define LARGER_COMMON 12
#define LARGE_COMMON 15

#define LHEIGHT_COMMON 40
#define MHEIGHT_COMMON 50
#define HHEIGHT_COMMON 60
#define HHHEIGHT_COMMON 80

//通用控件外间距
#define SMALL_MARGING 10
#define MIDDLE_MARGING 20
#define LARGE_MARGING 30

//常用字体大小
#define SMALLER_TEXT 12
#define SMALL_TEXT 14
#define MIDDLE_TEXT 16
#define LARGE_TEXT 18
#define LARGER_TEXT 20

#endif
