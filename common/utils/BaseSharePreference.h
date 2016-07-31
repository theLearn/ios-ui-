//
//  BaseSharePreference.h
//  learn
//
//  Created by 洪诚 on 16/7/17.
//  Copyright © 2016年 洪诚. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSUserDefaults *preference;

@interface BaseSharePreference : NSObject

+(instancetype)getInstance;

-(void)setString:(NSString *)content forKey:(NSString *)key;
-(void)setInt:(NSInteger)i forKey:(NSString *)key;
-(void)setBOOL:(BOOL)is forKey:(NSString *)key;
-(void)setFloat:(float)f forKey:(NSString *)key;
-(void)setDouble:(double)d forKey:(NSString *)key;

-(NSString *)getString:(NSString *)key;
-(NSInteger)getInt:(NSString *)key;
-(BOOL)getBOOL:(NSString *)key;
-(float)getFloat:(NSString *)key;
-(double)getDouble:(NSString *)key;

@end
