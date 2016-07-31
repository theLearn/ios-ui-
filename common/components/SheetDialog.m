//
//  SheetDialog.m
//  learn
//
//  Created by 洪诚 on 16/7/30.
//  Copyright © 2016年 洪诚. All rights reserved.
//

#import "SheetDialog.h"

@implementation SheetDialog

-(instancetype)initWithTitle:(NSString *) title
{
    return [self initWithTitle:title withStyle:UIActionSheetStyleDefault];
}

-(instancetype)initWithTitle:(NSString *) title withStyle:(UIActionSheetStyle) style
{
    self = [super init];
    
    if(self)
    {
        
        actionArray = [[NSMutableArray alloc] init];
        
        if(ISABOVE8)
        {
            alertVC = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleActionSheet];

        }
        else
        {
            sheet = [[UIActionSheet alloc] init];
            [sheet setTitle:title];
            [sheet setDelegate:self];
            sheet.actionSheetStyle = style;
        }
    }
    
    return self;
}

-(instancetype)putAction:(NSString *)actionName withAction:(void (^)()) doAction
{
    if(ISABOVE8)
    {
        UIAlertAction *action = [UIAlertAction actionWithTitle:actionName style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            doAction();
        }];
        
        [alertVC addAction:action];
    }
    else
    {
        [actionArray addObject:doAction];
        [sheet addButtonWithTitle:actionName];
    }
    
    return self;
}

-(void)show:(UIViewController *)vc
{
    if(ISABOVE8)
    {
        [vc presentViewController:alertVC animated:YES completion:nil];
    }
    else
    {
        [sheet showInView:vc.view];
    }
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    doAction action = [actionArray objectAtIndex:buttonIndex];
    action();
}

@end
