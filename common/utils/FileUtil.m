//
//  FileUtil.m
//  learn
//
//  Created by 洪诚 on 16/7/30.
//  Copyright © 2016年 洪诚. All rights reserved.
//

#import "FileUtil.h"

@implementation FileUtil

+(long long)fileSizeAtPath:(NSString*) filePath
{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}

//遍历文件夹获得文件夹大小，返回多少M
+(float)folderSizeAtPath:(NSString*) folderPath
{
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    NSString* fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [FileUtil fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize/(1024.0*1024.0);
}

+ (NSString *)clearCache
{
    //清除缓存目录
    NSArray *searchPaths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *searchPath = [searchPaths lastObject];
    
    NSString *str = [NSString stringWithFormat:@"缓存已清除%fM", [FileUtil folderSizeAtPath:searchPath]];
    NSLog(@"%@",str);
    NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:searchPath];
    for (NSString *p in files)
    {
        NSError *error;
        NSString *currPath = [searchPath stringByAppendingPathComponent:p];
        if ([[NSFileManager defaultManager] fileExistsAtPath:currPath]) {
            BOOL ret = [[NSFileManager defaultManager] removeItemAtPath:currPath error:&error];
//            YYLog(@"移除文件 %@ ret= %d", currPath, ret);
        }else{
//            YYLog(@"文件不存在 %@", currPath);
        }
    }
    return str;
}

@end
