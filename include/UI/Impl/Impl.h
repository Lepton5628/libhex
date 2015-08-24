//
//  Impl.h
//  libhex
//
//  Created by Max C on 8/23/15.
//  Copyright (c) 2015 Max C. All rights reserved.
//

#ifndef LIBHEX_UI_Impl_h
#define LIBHEX_UI_Impl_h

#include <Engine/Common.h>
#include <Model/OutputBuffer.h>
#include <UI/Attribute.h>

@protocol Hex_UIImplementation

+ (void) setRawMode:(bool) useRawMode;

+ (void) UIDidFinishLaunching;
+ (void) UIWillTerminate;

+ (void) initialize;

+ (id<Hex_UIImplementation>) getInstance;

- (id) init;

- (void) measureOutput;

- (void) refresh;
- (void) clear;

- (char) getCharacter;
- (void) getString:(char *) buffer withLength:(int) length;

@property (weak, atomic, readwrite, assign) Hex_M_UIOutputBuffer *outputBuffer;

@property (atomic, readonly) int width;
@property (atomic, readonly) int height;

@property (atomic, readwrite) int x;
@property (atomic, readwrite) int y;

@end

/**
 * Base class which implements some of the variables and properties for <Hex_UIImplementation>, as well as it's singleton pattern.
 */
@interface Hex_UIImplementation_Base : HexObject {
    Hex_M_UIOutputBuffer *outputBuffer;
    
    Hex_Char **output_buffer_alias;
    bool **change_buffer_alias;
    
    int width, height;
    
    int x, y;
}

@property (weak, atomic, readwrite, assign) Hex_M_UIOutputBuffer *outputBuffer;

@property (atomic, readonly) int width;
@property (atomic, readonly) int height;

@property (atomic, readwrite) int x;
@property (atomic, readwrite) int y;

+ (void) initialize;
+ (id<Hex_UIImplementation>) getInstance;

@end

#endif
