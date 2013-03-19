//  Copyright (c) 2013 Oliver Jones. All rights reserved.
//

#import "UIColor+ORJColor.h"

UIColor *ORJUIColorFromRGBA(uint32_t rgbValue, CGFloat alpha) {
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0f
                           green:((float)((rgbValue & 0xFF00) >> 8))/255.0f
                            blue:((float)(rgbValue & 0xFF))/255.0f
                           alpha:alpha];
}

@implementation UIColor (ORJColor)

+ (UIColor *)orjColorWithCSSName:(NSString *)cssColorName
{
    static NSDictionary *colorNameCache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        colorNameCache = @{
            #define CSS(x, y) \
                @#y : ORJUIColorFromRGB(x),
            #include "CSSColors.def"
        };
    });
    
    UIColor *cachedColor = [colorNameCache objectForKey:[cssColorName lowercaseString]];
    if (cachedColor)
    {
        // We return a copy to avoid clients from over releasing members of the cache dictionary.
        return [UIColor colorWithCGColor:cachedColor.CGColor];
    }
    
    return nil;
}

@end
