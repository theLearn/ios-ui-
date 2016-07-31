

#import "HintView.h"
#import <QuartzCore/QuartzCore.h>
#import "ViewUtil.h"
#import "Dimen.h"

@implementation HintView

-(id)initWith:(NSString*)message
{
    self=[super init];
    if(self)
    {
        self.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        self.layer.cornerRadius=10;
        self.layer.masksToBounds=YES;
        //label
        UILabel*label=[[UILabel alloc]init];
        label.numberOfLines=0;
        label.textAlignment=NSTextAlignmentLeft;
        label.font=[UIFont systemFontOfSize:MIDDLE_TEXT];
        label.backgroundColor=[UIColor colorWithWhite:255 alpha:0];
        label.textColor=[UIColor whiteColor];
        label.text=message;

        //view最大宽度
        float maxWidth = SCREEN_WIDTH - 100;
        
        //高度固定不折行，根据字的多少计算label的宽度
        CGSize sizeW = [ViewUtil calculateSizeByContent:message andFont:label.font];
        //宽度不变，根据字的多少计算label的高度
        CGSize sizeH = [ViewUtil calculateSizeByContent:message andFont:label.font withMax:maxWidth isAllowNewLine:YES];
        //未达到限制宽度
        if(sizeW.width<maxWidth-40)
        {
            [self setFrame:CGRectMake((SCREEN_WIDTH-sizeW.width)/2-20, SCREEN_HEIGHT-120, sizeW.width+40, sizeW.height+16)];
            [label setFrame:CGRectMake(20, 8, sizeW.width, sizeW.height)];
        }
        //
        else
        {
            [self setFrame:CGRectMake((SCREEN_WIDTH-sizeH.width)/2-20, SCREEN_HEIGHT-120,sizeH.width+40, sizeH.height+16)];
            [label setFrame:CGRectMake(20, 8, sizeH.width, sizeH.height)];
        }
        [self addSubview:label];
    }
    return self;
}

-(void)showInView:(UIView*)view
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [view addSubview:self];
        self.layer.opacity=0;
        [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^
         {
             self.layer.opacity=1;
         }completion:^(BOOL finish){}];
        
        timer=[NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(miss) userInfo:nil repeats:NO];
    });
    
}
-(void)miss
{
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^
     {
         self.layer.opacity=0;
     }completion:^(BOOL finish)
    {
        [self removeFromSuperview];
    }];
}
@end
