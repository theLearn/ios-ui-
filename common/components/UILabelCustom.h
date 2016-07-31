//
//  UILabelCustom.h
//  learn
//
//  Created by 洪诚 on 16/7/20.
//  Copyright © 2016年 洪诚. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, VerticalAlignment)
{
    VerticalAlignmentTop,
    VerticalAlignmentCenter,
    VerticalAlignmentBottom
};

@interface UILabelCustom : UILabel

@property(nonatomic,assign)VerticalAlignment verticalAlignment;

@end
