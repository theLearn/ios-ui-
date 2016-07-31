//
//  FileUtil.h
//  learn
//
//  Created by 洪诚 on 16/7/30.
//  Copyright © 2016年 洪诚. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileUtil : NSObject

+(long long)fileSizeAtPath:(NSString*) filePath;
+(float)folderSizeAtPath:(NSString*) folderPath;
+(NSString *)clearCache;

@end
