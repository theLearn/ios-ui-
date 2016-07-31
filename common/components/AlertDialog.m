//
//  AlertDidlogUtil.m
//  learn
//
//  Created by 洪诚 on 16/7/23.
//  Copyright © 2016年 洪诚. All rights reserved.
//

#import "AlertDialog.h"

@implementation AlertDialog

-(instancetype)initWithTitle:(NSString *) title andMessage:(NSString *)message
{
    return [self initWithTitle:title andMessage:message withInputStyle:AlertDialogStyleDefault withInputText:nil];
}

-(instancetype)initWithTitle:(NSString *) title andMessage:(NSString *)message withInputStyle:(AlertDialogStyle) style withInputText:(NSArray<NSString *> *)array
{
    self = [super init];
    
    if(self)
    {
        NSString *firstText = @"";
        NSString *secondText = @"";
        
        if(array)
        {
            if([array count] >= 1)
            {
                firstText = [array objectAtIndex:0];
            }
            
            if(array && [array count] >= 2)
            {
                secondText = [array objectAtIndex:1];
            }
        }
        
        actionArray = [[NSMutableArray alloc] init];
        
        if(ISABOVE8)
        {
            alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
            
            if(AlertDialogStyleNormalTextInput == style)
            {
                [alertVC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                    textField.placeholder = firstText;
                    textField.clearButtonMode = UITextFieldViewModeAlways;
                }];
            }
            else if(AlertDialogStyleSecureTextInput == style)
            {
                [alertVC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                    textField.placeholder = firstText;
                    textField.secureTextEntry = YES;
                    textField.clearButtonMode = UITextFieldViewModeAlways;
                }];
            }
            else if(AlertDialogStyleLoginInput == style)
            {
                [alertVC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                    textField.placeholder = firstText;
                    textField.clearButtonMode = UITextFieldViewModeAlways;
                }];
                [alertVC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                    textField.placeholder = secondText;
                    textField.secureTextEntry = YES;
                    textField.clearButtonMode = UITextFieldViewModeAlways;
                }];
            }
        }
        else
        {
            alert = [[UIAlertView alloc] init];
            [alert setTitle:title];
            [alert setMessage:message];
            [alert setDelegate:self];
            
            switch (style) {
                case AlertDialogStyleNormalTextInput:
                    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
                    [alert textFieldAtIndex:0].placeholder = firstText;
                    [alert textFieldAtIndex:0].clearButtonMode = UITextFieldViewModeAlways;
                    break;
                case AlertDialogStyleSecureTextInput:
                    alert.alertViewStyle = UIAlertViewStyleSecureTextInput;
                    [alert textFieldAtIndex:0].placeholder = firstText;
                    [alert textFieldAtIndex:0].secureTextEntry = YES;
                    [alert textFieldAtIndex:0].clearButtonMode = UITextFieldViewModeAlways;
                    break;
                case AlertDialogStyleLoginInput:
                    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
                    [alert textFieldAtIndex:0].placeholder = firstText;
                    [alert textFieldAtIndex:0].clearButtonMode = UITextFieldViewModeAlways;
                    [alert textFieldAtIndex:1].placeholder = secondText;
                    [alert textFieldAtIndex:1].secureTextEntry = YES;
                    [alert textFieldAtIndex:1].clearButtonMode = UITextFieldViewModeAlways;
                    break;
                default:
                    break;
            }
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
        [alert addButtonWithTitle:actionName];
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
        [alert show];
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    doAction action = [actionArray objectAtIndex:buttonIndex];
    action();
}

-(NSString *)getStringByIndex:(NSInteger) i
{
    UITextField *textField = nil;
    if(ISABOVE8)
    {
        textField = [[alertVC textFields] objectAtIndex:i];
    }
    else
    {
        textField = [alert textFieldAtIndex:i];
    }
    
    if(textField)
    {
        return textField.text;
    }
    else
    {
        return @"";
    }
    
}

@end
