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

+ (UIColor *)orjUIColorWithCSSName:(NSString *)cssColorName
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

+ (NSString *)orjCSSColorForUIColor:(UIColor *)color
{
    static NSDictionary *colorNameCache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        colorNameCache = @{
            #define CSS(x, y) \
                [@#x lowercaseString] : @#y,
            #include "CSSColors.def"
        };
    });
    
    size_t componentCount = CGColorGetNumberOfComponents(color.CGColor);
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    
    NSString *colorAsHex = componentCount >= 3
        ? [NSString stringWithFormat:@"%02hhx%02hhx%02hhx", (uint8_t)(components[0] * 255u), (uint8_t)(components[1] * 255u), (uint8_t)(components[1] * 255u)]
        : [NSString stringWithFormat:@"%02hhx%02hhx%02hhx", (uint8_t)(components[0] * 255u), (uint8_t)(components[0] * 255u), (uint8_t)(components[0] * 255u)];
    
    NSString *colorName = [colorNameCache objectForKey:[@"0x" stringByAppendingString:colorAsHex]];
    if (colorName)
    {
        // We return a copy to avoid clients from over releasing members of the cache dictionary.
        return [colorName copy];
    }

    return [@"#" stringByAppendingString:colorAsHex];
}


@end
