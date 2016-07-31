

#ifndef LanguageTypeEnum_h
#define LanguageTypeEnum_h

typedef NS_ENUM(NSInteger, MessageSendType)
{
    MessageTypeOfFamilyInfo = 0,    //家信
    MessageTypeOfSMS,        //短信
    MessageTypeOfemail,         //email
};

typedef NS_ENUM(NSInteger, LanguageType)
{
    LanguageTypeBySystem = 0,  //跟随系统
    LanguageTypeOfChinese = 1,  //中文
    LanguageTypeOfEnglish = 2,  //英文
    LanguageTypeOfBe = 3,      //白俄
    LanguageTypeInvalideMax,         //最大无效值 （增加语言枚举，请在之前增加）
};

#endif /* MessageTypeEnum_h */
