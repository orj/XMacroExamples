//  Copyright (c) 2013 Oliver Jones. All rights reserved.
//

#import "ORJThemeViewController.h"
#import "ORJTheme.h"

#define UIViewAutoresizingFlexibleMargins (UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin);

@implementation ORJThemeViewController

- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    view.backgroundColor = [ORJTheme colorForViewBackground];
    
    UILabel *helloLabel = [ORJTheme labelForHelloXMacrosWithFrame:CGRectMake(0, 100, 320, 88)];
    helloLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    helloLabel.text = @"Hello X Macros";
    helloLabel.textAlignment = NSTextAlignmentCenter;
    
    [view addSubview:helloLabel];
    
    UIImageView *imageView = [ORJTheme imageViewForHelloXMacros];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleMargins;
    imageView.center = view.center;
    
    [view addSubview:imageView];
    
    self.view = view;
}

@end
