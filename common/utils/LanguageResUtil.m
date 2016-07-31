#import "LanguageResUtil.h"

@implementation LanguageResUtil


+(LanguageResUtil *)getInstance
{
    static LanguageResUtil *languageTools;
    static  dispatch_once_t  onceToken;
    dispatch_once(&onceToken, ^{
        languageTools = [[LanguageResUtil alloc] init];
    });
    return languageTools;
}

-(id)init
{
    self = [super init];
    if (self)
    {
        self.currentLanguageType = LanguageTypeInvalideMax;
    }
    return self;
}

//存储（切换）语言
-(void)saveDefineUserLanguage:(LanguageType)languageType
{
    if (languageType < LanguageTypeBySystem || languageType >= LanguageTypeInvalideMax)
    {
        languageType = LanguageTypeBySystem;
    }
    
    NSString *userLanguage;
    LanguageType newLanguageType = languageType;
    
    //获取当前语言
    userLanguage = [self returnResNameByLanguageType:languageType];
    newLanguageType = [self returnLanguageTypeByResName:userLanguage];
    
    if (!userLanguage
        || (_currentLanguageType == newLanguageType && languageType == LanguageTypeBySystem && [self isFollowToSystemeLanguage])
        || (_currentLanguageType == newLanguageType && languageType != LanguageTypeBySystem && ![self isFollowToSystemeLanguage]))
    {
        return;
    }
    _currentLanguageType = newLanguageType;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:userLanguage ofType:@"lproj"];
    _languageBundle = [NSBundle bundleWithPath:path];
    
    //持久化存储
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setValue:[NSString stringWithFormat:@"%ld",languageType] forKey:kUserLanguage];
    [def synchronize];
    
}

//返回当前语言类型（实际类型，如果是跟随系统，则返回系统语言类型，不支持的语种，当前按照英文处理）
-(LanguageType)defineUserLanguageType
{
    LanguageType languageType = LanguageTypeBySystem;
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString* type = [def valueForKey:kUserLanguage];
    if (type)
    {
        languageType = [type integerValue];
    }
    
    [self saveDefineUserLanguage:languageType];
    
    return _currentLanguageType;
}

//返回当前语言的资源名称（如@"en", @"zh-Hans", @"be-BY"等）（实际类型，如果是跟随系统，则返回系统语言类型，不支持的语种，当前按照英文处理）
-(NSString*)defineUserLanguage
{
    LanguageType type = [self defineUserLanguageType];
    return [self returnResNameByLanguageType:type];
}

//获取标签
-(NSString *)locatizedStringForkey:(NSString *)keyStr{
    //默认为本地资源文件名 为Localizable.strings
    NSString *str = [_languageBundle localizedStringForKey:keyStr value:nil table:@"Localizable"];
    return str;
}

//返回当前支持的语言列表，如果增加语言，这里需要修改
-(NSArray*)returnSupportLanguageArray
{
    return [[NSArray alloc]initWithObjects:@"en", @"zh-Hans", @"be-BY",nil];
}

//是否跟随系统
-(BOOL)isFollowToSystemeLanguage
{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString* type = [def valueForKey:kUserLanguage];
    if (type && ![type isEqualToString:[NSString stringWithFormat:@"%ld",LanguageTypeBySystem]])
    {
        return NO;
    }
    return YES;
}

//获取当前系统的语言资源
-(NSString*)returnPhoneSystemLanguage
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *languages = [defaults objectForKey : @"AppleLanguages"];
    
    // 获得当前iPhone使用的语言
    NSString* systemLanguage = [languages objectAtIndex:0];
    
    NSString* findChar = @"-";
    NSRange range = [systemLanguage rangeOfString:findChar];
    NSString* userLanguage = systemLanguage;
    
    if (range.location != NSNotFound)
    {
        userLanguage = [systemLanguage substringToIndex:range.location];
    }
    
    if ([userLanguage isEqualToString:@"zh"])
    {
        // 简体中文、繁体中文、香港中文、台湾中文都转换为之前的中文
        return @"zh-Hans";
    }
    else if([userLanguage isEqualToString:@"ru"])
    {
        return @"be-BY";
    }
    else
    {
        return @"en";
    }

}

//语言类型专为资源名称字符串
-(NSString*)returnResNameByLanguageType:(LanguageType)languageType
{
    NSString* languageResName = @"en";
    switch (languageType)
    {
        case LanguageTypeOfChinese:
            languageResName = @"zh-Hans";
            break;
        case LanguageTypeOfEnglish:
            languageResName = @"en";
            break;
        case LanguageTypeOfBe:
            languageResName = @"be-BY";
            break;
        default:
            languageResName = [self returnPhoneSystemLanguage];
            break;
    }
    return languageResName;
}

//资源名称字符串转为语言类型（实际类型）
-(LanguageType)returnLanguageTypeByResName:(NSString*)resName
{
    if (!resName)
    {
        return LanguageTypeOfEnglish;
    }
    
    if ([resName isEqualToString:@"zh-Hans"])
    {
        // 简体中文、繁体中文、香港中文、台湾中文都转换为之前的中文
        return LanguageTypeOfChinese;
    }
    else if([resName isEqualToString:@"be-BY"])
    {
        return LanguageTypeOfBe;
    }
    else
    {
        return LanguageTypeOfEnglish;
    }
}

-(NSString*)getLocalDesc:(LanguageType)type
{

    NSString* desc = @"";
    switch (type)
    {
        case LanguageTypeBySystem:
            desc = [self locatizedStringForkey:@"local_manager_system"];
            break;
        case LanguageTypeOfChinese:
            desc = [self locatizedStringForkey:@"local_manager_chinese"];
            break;
        case LanguageTypeOfEnglish:
            desc = [self locatizedStringForkey:@"local_manager_english"];
            break;
        case LanguageTypeOfBe:
            desc = [self locatizedStringForkey:@"local_manager_belarus"];
            break;
        default:
            break;
    }
    
    return desc;
}


@end
