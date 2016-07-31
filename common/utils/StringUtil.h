//
//  StringUtil.h
//  learn
//
//  Created by 洪诚 on 16/7/30.
//  Copyright © 2016年 洪诚. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringUtil : NSObject

+(BOOL) isEmpty:(NSString *)string;
+(BOOL) isValidNum:(NSString *)num;
+(BOOL) isValidPhone:(NSString *)num;
+(BOOL) isValidEmail:(NSString *)email;

@end
