//
//  DefaultTableViewCell.h
//  learn
//
//  Created by 洪诚 on 16/7/19.
//  Copyright © 2016年 洪诚. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonHeader.h"

typedef NS_ENUM(NSInteger, DefaultTableViewCellStyle)
{
    DefaultTableViewCellStyleNoImg,
    DefaultTableViewCellStyleOne,
    DefaultTableViewCellStyleTwoStyle1,
    DefaultTableViewCellStyleTwoStyle2,
    DefaultTableViewCellStyleThree,
    DefaultTableViewCellStyleFour
};

typedef NS_ENUM(NSInteger, RightActionStyle)
{
    RightActionStyleStyleNo,
    RightActionStyleStyleSwitch,
    RightActionStyleStyleTextButton,
    RightActionStyleStyleImgButton
};

@interface DefaultTableViewCell : UITableViewCell

{
    DefaultTableViewCellStyle localStyle;
    RightActionStyle localRightStyle;
    CGFloat cellHeight;
}

@property(nonatomic, readonly, strong)UIImageView *leftImg;
@property(nonatomic, readonly, strong)UIButton *rightAction;
@property(nonatomic, readonly, strong)UISwitch *rightSwitch;

@property(nonatomic, readonly, strong)UILabel *content;
@property(nonatomic, readonly, strong)UILabel *descrip;
@property(nonatomic, readonly, strong)UILabel *exContent;
@property(nonatomic, readonly, strong)UILabel *exDescrip;

-(instancetype)createCell:(DefaultTableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
-(instancetype)createCell:(DefaultTableViewCellStyle)style withHeight:(CGFloat)height reuseIdentifier:(NSString *)reuseIdentifier;
-(instancetype)createCell:(DefaultTableViewCellStyle)style withRightActionStyle:(RightActionStyle) rightStyle reuseIdentifier:(NSString *)reuseIdentifier;
-(instancetype)createCell:(DefaultTableViewCellStyle)style withRightActionStyle:(RightActionStyle) rightStyle withHeight:(CGFloat)height reuseIdentifier:(NSString *)reuseIdentifier;

-(void)buildCell;

@end
