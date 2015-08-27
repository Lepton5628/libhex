// -*- mode: objective-c++; -*-

//
//  Impl.h
//  libhex
//
//  Created by Max C on 8/25/15.
//  Copyright (c) 2015 Max C. All rights reserved.
//

#ifndef libhex_UI_Impl_h
#define libhex_UI_Impl_h

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

- (void) UIWindowSizeDidChange;

@property (weak, atomic, readwrite, assign) Hex_M_UIOutputBuffer *outputBuffer;

@property (atomic, readonly) int width;
@property (atomic, readonly) int height;

@property (atomic, readwrite) int x;
@property (atomic, readwrite) int y;

@end

#endif
