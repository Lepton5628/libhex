//
//  Attribute.m
//  libhex
//
//  Created by Max C on 8/26/15.
//  Copyright (c) 2015 Max C. All rights reserved.
//

#include <UI/Attribute.h>

@implementation HexColor
+ (unsigned char) colorWithR:(char)r G:(char)g B:(char) b {
    return [HexColor colorWithRGB:r :g :b];
}
    
+ (unsigned char) colorWithRGB:(char) r :(char) g :(char) b {
    return 16 + (36 * r) + (6 * g) + b;
}

+ (unsigned char) colorWithGreyscale:(char)g {
    return 0xE8 + g;
}
@end