//  Copyright (c) 2013 Oliver Jones. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGBA(r, g, b, a)
#define RGB(r, g, b) RGBA(r, g, b, 1.0f)

#define COLOR(name, color)              + (UIColor *)colorFor##name;
#define FONT(name, fontname, size)      + (UIFont *)fontFor##name;
#define IMAGE(name, filename)           + (UIImage *)imageFor##name;\
                                        + (UIImageView *)imageViewFor##name;
#define LABEL(name)                     + (UILabel *)labelFor##name##WithFrame:(CGRect)frame;

@interface ORJTheme : NSObject

#include "Theme.def"

@end

