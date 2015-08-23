//
//  Header.h
//  libhex
//
//  Created by Max C on 8/23/15.
//  Copyright (c) 2015 Max C. All rights reserved.
//

#ifndef libhex_Header_h
#define libhex_Header_h

#include <Engine/Common.h>

@interface Hex_MGPoint : HexObject {
    int x, y;
}

@property (atomic) int x, y;

- (id) initWithX:(int)x andY:(int) y;

@end

#endif
