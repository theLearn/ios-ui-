//
//  SecurityUtil.h
//  learn
//
//  Created by 洪诚 on 16/7/30.
//  Copyright © 2016年 洪诚. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h> 

@interface SecurityUtil : NSObject

+(NSString *)getMD5:(NSString *)signString;

+(NSString *)base64Encode:(NSString *)text;
+(NSString *)base64Decode:(NSString *)base64;

+(NSData *)base64DecodedString:(NSString *)string;
+(NSString *)base64EncodedStringFrom:(NSData *)data;

+(NSData *)DESEncrypt:(NSData *)data WithKey:(NSString *)key;
+(NSData *)DESDecrypt:(NSData *)data WithKey:(NSString *)key;

@end
