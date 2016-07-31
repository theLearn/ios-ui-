//
//  DefaultNavigationBar.h
//  learn
//
//  Created by 洪诚 on 16/7/14.
//  Copyright © 2016年 洪诚. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonHeader.h"
#import "DefaultHeaderDelegate.h"

@interface DefaultNavigationBar : UIView

@property(nonatomic,strong)UIActivityIndicatorView *activity;
@property(nonatomic,strong)id<DefaultHeaderDelegate> delegate;

-(instancetype)initWithFrame:(CGRect)frame andContent:(NSString *)content;
-(instancetype)initWithFrame:(CGRect)frame andContent:(NSString *)content withLeftPath:(NSString *)leftPath withRightPath:(NSString *)rightPath;

@end
