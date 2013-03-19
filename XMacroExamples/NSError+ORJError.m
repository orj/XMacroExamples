//  Copyright (c) 2013 Oliver Jones. All rights reserved.
//

#import "NSError+ORJError.h"

NSString *const ORJErrorDomain = @"ORJErrorDomain";

@implementation NSError (ORJError)

#define ERROR(name, code, key) \
+ (NSError *) orj##name##Error \
{ \
    return [self orjErrorWithCode:code message:NSLocalizedString(@#key, nil)]; \
} \
/**/

#include "ORJErrors.def"

+ (NSError *)orjErrorWithCode:(NSInteger)code message:(NSString *)message
{
    return [NSError errorWithDomain:ORJErrorDomain code:code userInfo:@{NSLocalizedDescriptionKey : message}];
}

+ (BOOL)isKnownORJError:(NSError *)error
{
    if ([error.domain isEqualToString:ORJErrorDomain])
    {
        switch (error.code)
        {
        #define ERROR(name, code, key) \
            case code:
        #include "ORJErrors.def"
                return YES;
            default:
                break;
        }
    }
    return NO;
}

@end
