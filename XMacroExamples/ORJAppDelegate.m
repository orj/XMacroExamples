//  Copyright (c) 2013 Oliver Jones. All rights reserved.
//

#import "ORJAppDelegate.h"
#import "ORJThemeViewController.h"
#import "UIColor+ORJColor.h"

@implementation ORJAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    self.window.rootViewController = [ORJThemeViewController new];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    NSLog(@"%@", [UIColor orjCSSColorForUIColor:[UIColor redColor]]);
    NSLog(@"%@", [UIColor orjCSSColorForUIColor:[UIColor whiteColor]]);
    
    NSLog(@"%@", [UIColor orjUIColorWithCSSName:@"white"]);
    NSLog(@"%@", [UIColor orjUIColorWithCSSName:@"blue"]);
    
    return YES;
}

@end
