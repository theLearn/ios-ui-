//
//  BaseViewController.h
//  learn
//
//  Created by 洪诚 on 16/7/8.
//  Copyright © 2016年 洪诚. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonHeader.h"
#import "DefaultNavigationBar.h"
#import "DefaultHeaderDelegate.h"

@interface BaseViewController : UIViewController<DefaultHeaderDelegate>

@property(strong,nonatomic)DefaultNavigationBar *defaultHeader;

-(void)createView;

-(void)initTitle:(NSString *)title withLeftPath:(NSString *)leftPath withRightPath:(NSString *)rightPath;
-(void)initTitle:(NSString *)title;

-(CGFloat)getStartY;

-(void)showWaiting;
-(void)stopWaiting;

-(void)showTitleLoading;
-(void)stopTitleLoading;

-(void)hideKeyBoard;

-(void)changeController:(UIViewController *) vc;
-(void)finish;

@end
