//
//  AlertDidlogUtil.h
//  learn
//
//  Created by 洪诚 on 16/7/23.
//  Copyright © 2016年 洪诚. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, AlertDialogStyle)
{
    AlertDialogStyleDefault,
    AlertDialogStyleSecureTextInput,
    AlertDialogStyleNormalTextInput,
    AlertDialogStyleLoginInput
};

typedef void (^doAction)();

@interface AlertDialog : NSObject<UIAlertViewDelegate>

{
    UIAlertController *alertVC;
    UIAlertView *alert;
    NSMutableArray *actionArray;
}

-(instancetype)initWithTitle:(NSString *) title andMessage:(NSString *)message;
-(instancetype)initWithTitle:(NSString *) title andMessage:(NSString *)message withInputStyle:(AlertDialogStyle) style withInputText:(NSArray<NSString *> *)array;
-(instancetype)putAction:(NSString *)actionName withAction:(void (^)()) doAction;
-(void)show:(UIViewController *)vc;

-(NSString *)getStringByIndex:(NSInteger) i;

@end
