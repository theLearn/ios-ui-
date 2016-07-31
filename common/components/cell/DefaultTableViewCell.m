//
//  DefaultTableViewCell.m
//  learn
//
//  Created by 洪诚 on 16/7/19.
//  Copyright © 2016年 洪诚. All rights reserved.
//

#import "DefaultTableViewCell.h"

@implementation DefaultTableViewCell


-(instancetype)createCell:(DefaultTableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    return [self createCell:style withRightActionStyle:RightActionStyleStyleNo withHeight:HHEIGHT_COMMON reuseIdentifier:reuseIdentifier];
}

-(instancetype)createCell:(DefaultTableViewCellStyle)style withHeight:(CGFloat)height reuseIdentifier:(NSString *)reuseIdentifier
{
    return [self createCell:style withRightActionStyle:RightActionStyleStyleNo withHeight:height reuseIdentifier:reuseIdentifier];
}

-(instancetype)createCell:(DefaultTableViewCellStyle)style withRightActionStyle:(RightActionStyle) rightStyle reuseIdentifier:(NSString *)reuseIdentifier
{
    return [self createCell:style withRightActionStyle:rightStyle withHeight:HHEIGHT_COMMON reuseIdentifier:reuseIdentifier];
}

-(instancetype)createCell:(DefaultTableViewCellStyle)style withRightActionStyle:(RightActionStyle) rightStyle withHeight:(CGFloat)height reuseIdentifier:(NSString *)reuseIdentifier
{
    localStyle = style;
    localRightStyle = rightStyle;
    cellHeight = height;
    return [self initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self)
    {
        [self buildCell];
    }
    
    return self;
}

-(void)buildCell
{
    self.contentView.frame = CGRectMake(0, 0, SCREEN_WIDTH, cellHeight);

    if(DefaultTableViewCellStyleNoImg != localStyle)
    {
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(MID_COMMON, MID_COMMON, cellHeight - 2 * MID_COMMON, cellHeight - 2 * MID_COMMON)];
        _leftImg = img;
        [self.contentView addSubview:img];
        
        UIButton *right = nil;
        UISwitch *st = nil;
        CGSize size = [ViewUtil calculateSizeByContent:@"执行" FontSize:SMALL_TEXT];
        
        switch (localRightStyle)
        {
            case RightActionStyleStyleImgButton:
                right = [[UIButton alloc] initWithFrame:CGRectMake(self.contentView.frame.size.width - MID_COMMON - MIDDLE_MARGING, (cellHeight- MID_COMMON) / 2, MID_COMMON, MID_COMMON)];
                [right setBackgroundImage:[UIImage imageNamed:@"myFamily_arrow"] forState:UIControlStateNormal];
                right.enabled = NO;
                _rightAction = right;
                [self.contentView addSubview:right];
                break;
            case RightActionStyleStyleTextButton:
                right = [[UIButton alloc] initWithFrame:CGRectMake(self.contentView.frame.size.width - size.width - 3 * MID_COMMON, (self.contentView.frame.size.height - size.height) / 2 - SMALL_COMMON, size.width + 2 * MID_COMMON, size.height + 2 * SMALL_COMMON)];
                right.layer.borderWidth = 1;
                right.layer.borderColor = [UIColor getMainUIColor].CGColor;
                right.layer.masksToBounds = YES;
                right.layer.cornerRadius=8.0f;
                [right setTitle:@"执行" forState:UIControlStateNormal];
                [right setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
                [right.titleLabel setFont:[UIFont systemFontOfSize:SMALL_TEXT]];
                _rightAction = right;
                [self.contentView addSubview:right];
                break;
            case RightActionStyleStyleSwitch:
                st = [[UISwitch alloc] init];
                st.frame = CGRectMake(self.contentView.frame.size.width - st.frame.size.width - MID_COMMON, (self.contentView.frame.size.height - st.frame.size.height) / 2, st.frame.size.width, st.frame.size.height);
                _rightSwitch = st;
                [self.contentView addSubview:st];
                break;
                
            default:
                break;
        }
        
        CGFloat rightX = self.contentView.frame.size.width;
        
        if(right)
        {
            rightX = right.frame.origin.x - MID_COMMON;
        }
        else if(st)
        {
            rightX = st.frame.origin.x - MID_COMMON;
        }
        
        UILabelCustom *firstContent = nil;
        UILabelCustom *firstDes = nil;
        UILabelCustom *secondContent = nil;
        UILabelCustom *secondDes = nil;
        
        switch (localStyle)
        {
            case DefaultTableViewCellStyleOne:
                firstContent = [[UILabelCustom alloc] initWithFrame:CGRectMake(cellHeight, MID_COMMON, rightX - cellHeight, cellHeight - 2 * MID_COMMON)];
                firstContent.textAlignment = NSTextAlignmentLeft;
                firstContent.verticalAlignment = VerticalAlignmentCenter;
                _content = firstContent;
                [self.contentView addSubview:firstContent];
                break;
            case DefaultTableViewCellStyleTwoStyle1:
                firstContent = [[UILabelCustom alloc] initWithFrame:CGRectMake(cellHeight, MID_COMMON, (rightX - cellHeight - MIDDLE_MARGING) / 2, cellHeight - 2 *MID_COMMON)];
                firstContent.textAlignment = NSTextAlignmentLeft;
                firstContent.verticalAlignment = VerticalAlignmentCenter;
                _content = firstContent;
                [self.contentView addSubview:firstContent];
                
                secondContent = [[UILabelCustom alloc] initWithFrame:CGRectMake(cellHeight + (rightX - cellHeight + MIDDLE_MARGING) / 2, MID_COMMON, (rightX - cellHeight - MIDDLE_MARGING) / 2, cellHeight -  2 * MID_COMMON)];
                secondContent.textAlignment = NSTextAlignmentRight;
                secondContent.verticalAlignment = VerticalAlignmentCenter;
                secondContent.textColor = [UIColor getSmallTextColor];
                secondContent.font = [UIFont systemFontOfSize:SMALL_TEXT];
                _descrip = secondContent;
                [self.contentView addSubview:secondContent];
                break;
            case DefaultTableViewCellStyleTwoStyle2:
                firstContent = [[UILabelCustom alloc] initWithFrame:CGRectMake(cellHeight, MID_COMMON, rightX - cellHeight, cellHeight / 2 -  MID_COMMON)];
                firstContent.textAlignment = NSTextAlignmentLeft;
                firstContent.verticalAlignment = VerticalAlignmentTop;
                _content = firstContent;
                [self.contentView addSubview:firstContent];
                
                firstDes = [[UILabelCustom alloc] initWithFrame:CGRectMake(cellHeight, cellHeight / 2, rightX - cellHeight, cellHeight / 2 -  MID_COMMON)];
                firstDes.textAlignment = NSTextAlignmentLeft;
                firstDes.verticalAlignment = VerticalAlignmentBottom;
                firstDes.textColor = [UIColor getSmallTextColor];
                firstDes.font = [UIFont systemFontOfSize:SMALL_TEXT];
                _descrip = firstDes;
                [self.contentView addSubview:firstDes];
                
                break;
            case DefaultTableViewCellStyleFour:
                secondDes = [[UILabelCustom alloc] initWithFrame:CGRectMake(cellHeight + (rightX - cellHeight + MIDDLE_MARGING) / 2, cellHeight / 2, (rightX - cellHeight - MIDDLE_MARGING) / 2, cellHeight / 2 -  MID_COMMON)];
                secondDes.textAlignment = NSTextAlignmentLeft;
                secondDes.verticalAlignment = VerticalAlignmentBottom;
                secondDes.textColor = [UIColor getSmallTextColor];
                secondDes.font = [UIFont systemFontOfSize:SMALL_TEXT];
                _exDescrip = secondDes;
                [self.contentView addSubview:secondDes];
            case DefaultTableViewCellStyleThree:
                firstContent = [[UILabelCustom alloc] initWithFrame:CGRectMake(cellHeight, MID_COMMON, (rightX - cellHeight - MIDDLE_MARGING) / 2, cellHeight / 2 -  MID_COMMON)];
                firstContent.textAlignment = NSTextAlignmentLeft;
                firstContent.verticalAlignment = VerticalAlignmentTop;
                _content = firstContent;
                [self.contentView addSubview:firstContent];
                
                secondContent = [[UILabelCustom alloc] initWithFrame:CGRectMake(cellHeight + (rightX - cellHeight + MIDDLE_MARGING) / 2, MID_COMMON, (rightX - cellHeight - MIDDLE_MARGING) / 2, cellHeight / 2 -  MID_COMMON)];
                secondContent.textAlignment = NSTextAlignmentLeft;
                secondContent.verticalAlignment = VerticalAlignmentTop;
                _exContent = secondContent;
                [self.contentView addSubview:secondContent];
                
                firstDes = [[UILabelCustom alloc] initWithFrame:CGRectMake(cellHeight, cellHeight / 2, (rightX - cellHeight - MIDDLE_MARGING) / 2, cellHeight / 2 -  MID_COMMON)];
                firstDes.textAlignment = NSTextAlignmentLeft;
                firstDes.verticalAlignment = VerticalAlignmentBottom;
                firstDes.font = [UIFont systemFontOfSize:SMALL_TEXT];
                firstDes.textColor = [UIColor getSmallTextColor];
                _descrip = firstDes;
                [self.contentView addSubview:firstDes];
                break;
            default:
                break;
        }
    }
}

@end
