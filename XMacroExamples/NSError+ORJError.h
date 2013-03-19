//  Copyright (c) 2013 Oliver Jones. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const ORJErrorDomain;

typedef enum {
#define ERROR(name, code, message) ORJErrorCode##name,
#include "ORJErrors.def"
} ORJErrorCode;


@interface NSError (ORJError)

+ (NSError *)orjErrorWithCode:(NSInteger)code message:(NSString *)message;

#define ERROR(name, code, message) + (NSError *) orj##name##Error;
#include "ORJErrors.def"

+ (BOOL)isKnownORJError:(NSError *)error;

@end
