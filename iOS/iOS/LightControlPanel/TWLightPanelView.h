
#import <Foundation/Foundation.h>
@class TWLightPanelController;

@interface TWLightPanelView : UIView

@property(nonatomic, strong) TWLightPanelController *delegate;
-(UIButton *) createButtonByRect: (CGRect) rect andWithTitle:(NSString *)title;

@end