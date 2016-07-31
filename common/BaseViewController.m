//
//  BaseViewController.m
//  learn
//
//  Created by 洪诚 on 16/7/8.
//  Copyright © 2016年 洪诚. All rights reserved.
//

#import "BaseViewController.h"
#import "AppDelegate.h"

@implementation BaseViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self createView];
}

-(void)createView
{
    [self.view setBackgroundColor:[UIColor getCommonBackgroundColor]];
    //TODO
}

-(void)initTitle:(NSString *)title withLeftPath:(NSString *)leftPath withRightPath:(NSString *)rightPath
{
    UIView *statusBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, STATUS_BAR_HEIGHT)];
    statusBar.backgroundColor = [UIColor getMainUIColor];
    [self.view addSubview:statusBar];
    
    _defaultHeader =[[DefaultNavigationBar alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, SCREEN_WIDTH, LHEIGHT_COMMON + 2 * SMALL_MARGING) andContent:title withLeftPath:leftPath withRightPath:rightPath];
    _defaultHeader.delegate = self;
    [self.view addSubview:_defaultHeader];
}

-(void)initTitle:(NSString *)title
{
    UIView *statusBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, STATUS_BAR_HEIGHT)];
    statusBar.backgroundColor = [UIColor getMainUIColor];
    [self.view addSubview:statusBar];
    
    _defaultHeader =[[DefaultNavigationBar alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, SCREEN_WIDTH, LHEIGHT_COMMON + 2 * SMALL_MARGING) andContent:title];
    _defaultHeader.delegate = self;
    [self.view addSubview:_defaultHeader];
}

-(CGFloat)getStartY
{
    if(_defaultHeader)
    {
        return _defaultHeader.frame.size.height + STATUS_BAR_HEIGHT;
    }
    else
    {
        return STATUS_BAR_HEIGHT;
    }
    
}

-(void)showWaiting
{
    [[ViewUtil getInstance] showWaiting:self];
}

-(void)stopWaiting
{
    [[ViewUtil getInstance]stopWaiting];
}

-(void)showTitleLoading
{
    if(self.defaultHeader)
    {
        [self.defaultHeader.activity startAnimating];
        self.defaultHeader.activity.hidden = NO;
    }
}

-(void)stopTitleLoading
{
    if(self.defaultHeader)
    {
        [self.defaultHeader.activity stopAnimating];
        self.defaultHeader.activity.hidden = YES;
    }
}

-(void)hideKeyBoard
{
    [self.view endEditing:YES];
}

-(void)changeController:(UIViewController *) vc
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if([appDelegate.window.rootViewController isKindOfClass:[UINavigationController class]])
    {
        [(UINavigationController *)appDelegate.window.rootViewController pushViewController:vc animated:YES];
    }
}

-(void)finish
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if([appDelegate.window.rootViewController isKindOfClass:[UINavigationController class]])
    {
        [(UINavigationController *)appDelegate.window.rootViewController popViewControllerAnimated:YES];
    }
}

-(void)back
{
    NSLog(@"BACK");
    [self finish];
}

-(void)more
{
    NSLog(@"MORE");
}

@end
