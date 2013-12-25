
#import "TWLightPanelView.h"
#import "Utility.h"


@implementation TWLightPanelView {
    Utility *utility;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        utility = [[Utility alloc] init];
        [self createUIPart];

    }
    return self;
}

-(UIButton *) createButtonByRect: (CGRect) rect andWithTitle:(NSString *)title {
    UIButton *button = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    button.frame = rect;
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:_delegate action: @selector(alertWithTitle:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void) createUIPart {

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, [utility getScreenWidth], 40)];
    [label setText:@"iOS Lighter"];
    [label setTextColor: [UIColor orangeColor]];
    [label setFont:[UIFont systemFontOfSize:20]];
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];

    UIButton *openButton = [self createButtonByRect:CGRectMake(20, 140, 80, 40) andWithTitle:@"Open"];
    [self addSubview:openButton];

    UIButton *closeButton = [self createButtonByRect:CGRectMake(220, 140, 80, 40) andWithTitle:@"Close"];
    [self addSubview:closeButton];

    UIButton *redButton = [self createButtonByRect:CGRectMake(20, 230, 80, 40) andWithTitle:@"Red"];
    [self addSubview:redButton];

    UIButton *yellowButton = [self createButtonByRect:CGRectMake(120, 230, 80, 40) andWithTitle:@"Yellow"];
    [self addSubview:yellowButton];

    UIButton *blueButton = [self createButtonByRect:CGRectMake(220, 230, 80, 40) andWithTitle:@"Blue"];
    [self addSubview:blueButton];

    UIButton *blackButton = [self createButtonByRect:CGRectMake(20, 300, 80, 40) andWithTitle:@"Black"];
    [self addSubview:blackButton];

    UIButton *whiteButton = [self createButtonByRect:CGRectMake(120, 300, 80, 40) andWithTitle:@"White"];
    [self addSubview:whiteButton];

    UIButton *greenButton = [self createButtonByRect:CGRectMake(220, 300, 80, 40) andWithTitle:@"Green"];
    [self addSubview:greenButton];

}


@end