//  Copyright (c) 2013 Oliver Jones. All rights reserved.
//

#import <UIKit/UIKit.h>

extern UIColor *ORJUIColorFromRGBA(uint32_t colorHex, CGFloat alpha);

static inline UIColor *ORJUIColorFromRGB(uint32_t rgbValue) {
    return ORJUIColorFromRGBA((rgbValue), 1.0f);
}

@interface UIColor (ORJColor)
+ (UIColor *)orjUIColorWithCSSName:(NSString *)cssColorName;
+ (NSString *)orjCSSColorForUIColor:(UIColor *)color;
@end
