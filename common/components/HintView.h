

#import <UIKit/UIKit.h>

@interface HintView : UIView
{
    NSTimer*timer;
}
-(id)initWith:(NSString*)message;
-(void)showInView:(UIView*)view;
@end
