//
//  DefaultNavigationBar.m
//  learn
//
//  Created by 洪诚 on 16/7/14.
//  Copyright © 2016年 洪诚. All rights reserved.
//

#import "DefaultNavigationBar.h"

@implementation DefaultNavigationBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame andContent:(NSString *)content
{
    return [self initWithFrame:frame andContent:content withLeftPath:@"navigationBar_back" withRightPath:@"navigationBar_addButton"];
}

-(instancetype)initWithFrame:(CGRect)frame andContent:(NSString *)content withLeftPath:(NSString *)leftPath withRightPath:(NSString *)rightPath
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        self.backgroundColor = [UIColor getMainUIColor];
        
        UIButton *back = [[UIButton alloc] initWithFrame:CGRectMake(MIDDLE_MARGING, MIDDLE_MARGING, [@"navigationBar_back" isEqualToString:leftPath] ? 15 : MIDDLE_MARGING, MIDDLE_MARGING)];
        [back setBackgroundImage:[UIImage imageNamed:leftPath] forState:UIControlStateNormal];
        [back addTarget:_delegate action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        CGFloat textMax = frame.size.width - 2 *(LHEIGHT_COMMON + 2 * SMALL_MARGING) - SMALL_MARGING - MIDDLE_MARGING;
        CGSize textSize = [ViewUtil calculateSizeByContent:content FontSize:LARGER_TEXT withMax:textMax];
        UILabel *centerTitle = [[UILabel alloc] initWithFrame:CGRectMake((frame.size.width - textSize.width) / 2, (frame.size.height - textSize.height) / 2, textSize.width, textSize.height)];
        centerTitle.font = [UIFont systemFontOfSize:LARGER_TEXT];
        centerTitle.textColor = [UIColor whiteColor];
        [centerTitle setText:content];
        
        _activity = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(centerTitle.frame.origin.x + centerTitle.frame.size.width + SMALL_COMMON, (frame.size.height - MIDDLE_MARGING) / 2, MIDDLE_MARGING, MIDDLE_MARGING)];
        _activity.hidden = YES;
        
        UIButton *moreBt = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width - 2 * MIDDLE_MARGING, MIDDLE_MARGING, MIDDLE_MARGING, MIDDLE_MARGING)];
        [moreBt setBackgroundImage:[UIImage imageNamed:rightPath] forState:UIControlStateNormal];
        [moreBt addTarget:_delegate action:@selector(more) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:back];
        [self addSubview:centerTitle];
        [self addSubview:_activity];
        [self addSubview:moreBt];
    }
    
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame andContent:@"Learn"];
}

@end
