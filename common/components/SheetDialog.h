//
//  SheetDialog.h
//  learn
//
//  Created by 洪诚 on 16/7/30.
//  Copyright © 2016年 洪诚. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^doAction)();

@interface SheetDialog : NSObject<UIActionSheetDelegate>

{
    UIAlertController *alertVC;
    UIActionSheet *sheet;
    NSMutableArray *actionArray;
}

-(instancetype)initWithTitle:(NSString *) title;
-(instancetype)initWithTitle:(NSString *) title withStyle:(UIActionSheetStyle) style;
-(instancetype)putAction:(NSString *)actionName withAction:(void (^)()) doAction;
-(void)show:(UIViewController *)vc;

@end
