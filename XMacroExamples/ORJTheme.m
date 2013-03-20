//  Copyright (c) 2013 Oliver Jones. All rights reserved.
//

#import "ORJTheme.h"

#import "UIColor+ORJColor.h"

#define RGBA(r, g, b, a)    ORJUIColorFromRGBA( ( ((r)<<16)| ((g)<<8) | (b) ), (a))
#define RGB(r, g, b)        RGBA(r, g, b, 1.0f)

#define COLOR(name, color)          + (UIColor *)colorFor##name { return color; }

#define IMAGE(name, filename)       + (UIImage *)imageFor##name { return [UIImage imageNamed:(@#filename)]; } \
                                    + (UIImageView *)imageViewFor##name { return [[UIImageView alloc] initWithImage:[self imageFor##name]]; }

#define FONT(name, fontname, fontsize)  + (UIFont *)fontFor##name { return [UIFont fontWithName:(@#fontname) size:(fontsize)]; }

#define LABEL(name) + (UILabel *)labelFor##name##WithFrame:(CGRect)frame { \
    return [self labelWithFrame:frame \
                      textColor:[self colorFor##name##Text] \
                textShadowColor:[self colorFor##name##TextShadow] \
                backgroundColor:[self colorFor##name##Background] \
                           font:[self fontFor##name##Text]]; \
}


@implementation ORJTheme

#include "Theme.def"

+ (UILabel *)labelWithFrame:(CGRect)frame
                  textColor:(UIColor *)textColor
            textShadowColor:(UIColor *)textShadowColor
            backgroundColor:(UIColor *)backgroundColor
                       font:(UIFont *)font
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.textColor = textColor;
    label.shadowColor = textShadowColor;
    label.font = font;
    label.backgroundColor = backgroundColor;
    
    return label;
}

@end
