// -*- mode: objective-c; -*-
//
//  Point.h
//  libhex
//
//  Created by Max C on 8/23/15.
//  Copyright (c) 2015 Max C. All rights reserved.

#ifndef libhex_Header_h
#define libhex_Header_h

#import <Engine/Common.h>

struct Hex_MGPoint {
    int x, y;

    Hex_MGPoint(int x, int y){
        this->x = x;
        this->y = y;
    }
};

#endif
