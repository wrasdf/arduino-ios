
#import "TWLightPanelController.h"
#import "TWLightPanelView.h"
#import "Constant.h"
#import "Utility.h"

@implementation TWLightPanelController {
    Utility *utility;
    TWLightPanelView *lightView;
}

- (id)init {
    self = [super init];
    if (self) {
        utility = [[Utility alloc] init];
    }

    return self;
}

- (void)loadView {
    lightView = [[TWLightPanelView alloc] initWithFrame:CGRectMake(0, 0, [utility getScreenWidth], [utility getScreenHeight] - UI_STATUS_BAR_HEIGHT)];
    self.view = lightView;
}

-(void)viewDidLoad {}

-(IBAction) alertWithTitle: (id) sender {
    UIButton* btn = (UIButton *) sender;
    NSString* buttonValue = btn.currentTitle;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                    message:[NSString stringWithFormat:@"您点击了%@按钮", buttonValue]
                                                   delegate:self
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
}


@end