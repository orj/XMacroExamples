//  Copyright (c) 2013 Oliver Jones. All rights reserved.
//

#import <UIKit/UIKit.h>

extern UIColor *ORJUIColorFromRGBA(uint32_t colorHex, CGFloat alpha);

#define ORJUIColorFromRGB(rgbValue) ORJUIColorFromRGBA((rgbValue), 1.0f)

@interface UIColor (ORJColor)
+ (UIColor *)orjColorWithCSSName:(NSString *)cssColorName;
@end
