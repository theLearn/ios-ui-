
#import <Foundation/Foundation.h>
#import "LanguageTypeEnum.h"

#define kUserLanguage @"userLanguage"

@interface LanguageResUtil : NSObject

@property (nonatomic)LanguageType currentLanguageType;
@property (nonatomic,strong)NSBundle *languageBundle;

+(LanguageResUtil *)getInstance;

//存储（切换）语言
-(void)saveDefineUserLanguage:(LanguageType)languageType;

//返回当前语言的资源名称（如@"en", @"zh-Hans", @"be-BY"等）（实际类型，如果是跟随系统，则返回系统语言类型，不支持的语种，当前按照英文处理）
-(LanguageType)defineUserLanguageType;

//返回当前语言类型（实际类型，如果是跟随系统，则返回系统语言类型，不支持的语种，当前按照英文处理）
-(NSString*)defineUserLanguage;

-(NSString *)locatizedStringForkey:(NSString *)keyStr;

//返回当前支持的语言列表，如果增加语言，这里需要修改
-(NSArray*)returnSupportLanguageArray;

//是否跟随系统
-(BOOL)isFollowToSystemeLanguage;

-(NSString*)getLocalDesc:(LanguageType)type;

@end
