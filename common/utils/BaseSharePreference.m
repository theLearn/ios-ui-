//
//  BaseSharePreference.m
//  learn
//
//  Created by 洪诚 on 16/7/17.
//  Copyright © 2016年 洪诚. All rights reserved.
//

#import "BaseSharePreference.h"

@implementation BaseSharePreference

static BaseSharePreference *instance;

+(instancetype)getInstance
{
    if(instance == nil)
    {
        instance = [[BaseSharePreference alloc] init];
        preference = [NSUserDefaults standardUserDefaults];
    }
    
    return instance;
}

-(void)setString:(NSString *)content forKey:(NSString *)key
{
    [preference setObject:content forKey:key];
    [preference synchronize];
    
}

-(void)setInt:(NSInteger)i forKey:(NSString *)key
{
    [preference setInteger:i forKey:key];
    [preference synchronize];
}

-(void)setBOOL:(BOOL)is forKey:(NSString *)key
{
    [preference setBool:is forKey:key];
    [preference synchronize];
}

-(void)setFloat:(float)f forKey:(NSString *)key
{
    [preference setFloat:f forKey:key];
    [preference synchronize];
}

-(void)setDouble:(double)d forKey:(NSString *)key
{
    [preference setDouble:d forKey:key];
    [preference synchronize];
}


-(NSString *)getString:(NSString *)key
{
    return [preference objectForKey:key];
}

-(NSInteger)getInt:(NSString *)key
{
    return [preference integerForKey:key];
}

-(BOOL)getBOOL:(NSString *)key
{
    return [preference boolForKey:key];
}

-(float)getFloat:(NSString *)key
{
    return [preference floatForKey:key];
}

-(double)getDouble:(NSString *)key
{
    return [preference doubleForKey:key];
}

@end
