//
//  TTY.h
//  libhex
//
//  Created by Max C on 8/23/15.
//  Copyright (c) 2015 Max C. All rights reserved.
//

#ifndef LIBHEX_UI_Impl_TTY_h
#define LIBHEX_UI_Impl_TTY_h

# include <Engine/Common.h>

# include <Model/OutputBuffer.h>

# include <UI/Impl/Impl.h>
# include <UI/Attribute.h>

# include <sys/ioctl.h>
# include <termios.h>
# include <unistd.h>

# include <clocale>
# include <cstdio>

@interface Hex_UIImplementation_TTY : Hex_UIImplementation_Base<Hex_UIImplementation> {
    struct winsize windowSize;
}

@property (atomic, readwrite, assign) struct winsize windowSize;

+ (void) setRawMode:(bool) useRawMode;

+ (void) UIDidFinishLaunching;
+ (void) UIWillTerminate;

+ (void) UIWindowSizeDidChange;

- (id) init;

- (void) measureOutput;

- (void) refresh;
- (void) clear;

- (char) getCharacter;
- (void) getString:(char *) buffer withLength:(int) length;

@end

#endif
