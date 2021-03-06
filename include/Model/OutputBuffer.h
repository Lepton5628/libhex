// -*- mode: objective-c; -*-

//
//  OutputBuffer.h
//  libhex
//
//  Created by Max C on 8/23/15.
//  Copyright (c) 2015 Max C. All rights reserved.
//

#ifndef LIBHEX_Model_OutputBuffer_h
#define LIBHEX_Model_OutputBuffer_h

# include <Engine/Common.h>
# include <Model/Geometry/Point.h>

# include <UI/Attribute.h>

# include <cstring>

/**
 * Output Buffer.
 *
 * @MVC-Role: Model. attr
 */
@interface Hex_M_UIOutputBuffer : HexObject {
    Hex_Char *defaultAttributeSet;
    
    int x, y;
}

@property (atomic, readwrite) int width;
@property (atomic, readwrite) int height;

@property (atomic, readwrite) Hex_Char **output_buffer;
@property (atomic, readwrite) bool **change_buffer;

/**
 * Create new object with the dimensions specified in @c dimensions.
 *
 * @param dimensions A `Hex_MGPoint` where x = width & y = height
 */
- (id) initWithDimensions:(Hex_MGPoint) dimensions;

/**
 * Add character at current cursor position.
 *
 * @param chr The character to add
 */
- (void) addChar:(Hex_Char) chr;
/**
 * Add character at specified position.
 *
 * @param chr The character to add
 * @param pos The position to add it at.
 */
- (void) addChar:(Hex_Char) chr atPosition:(Hex_MGPoint) pos;

/**
 * Get character at current cursor position.
 *
 * @return Character at current cursor position.
 */
- (Hex_Char) getChar;
/**
 * Get character at specified position.
 *
 * @param pos Position to get character from.
 * @return The character at @c pos.
 */
- (Hex_Char) getCharAtPosition:(Hex_MGPoint) pos;

/**
 * Add string at current cursor position.
 *
 * @param str The string to add.
 */
- (void) addString:(char *) str;
/**
 * Add string at specified position.
 *
 * @param str The string to add.
 * @param pos The position to add it at.
 */
- (void) addString:(char *) str atPosition:(Hex_MGPoint) pos;

/**
 * Move cursor to position @c pos.
 *
 * @param pos The position to move to.
 */
- (void) moveTo:(Hex_MGPoint) pos;

/**
 * Allocates the internal buffers.
 */
- (void) allocateBuffers;
/**
 * Dealloctes the internal buffers.
 */
- (void) deallocateBuffers;

/**
 * Called when the corresponding output window resizes.
 *
 * @param size The size the window resizedTo.
 */
- (void) correspondingOutputDidResizeToDimensions:(Hex_MGPoint) size;

/**
 * Get the attributes at the specified position.
 *
 * @param pos The position from which we are getting the attributes.
 * @return The attributes at @c pos.
 */
- (Hex_Char) getAttributesAtPosition:(Hex_MGPoint) pos;

- (void) setForegroundTo:(unsigned char) fg atPosition:(Hex_MGPoint) pos;
- (void) setBackgroundTo:(unsigned char) bg atPosition:(Hex_MGPoint) pos;
- (void) setIsBoldTo:(bool) bold atPosition:(Hex_MGPoint) pos;
- (void) setIsReverseTo:(bool) reverse atPosition:(Hex_MGPoint) pos;
- (void) setIsBlinkingTo:(bool) blinking atPosition:(Hex_MGPoint) pos;

/**
 * Move the cursor forward by one.
 * Will newline if at edge of display (i.e. : nx(cx, cy) = { nx(MAX_X, cy) = (0, cy + 1), nx(cx,cy) = (cx + 1, cy))
 * If at end of display, will go to (0, 0).
 */
- (void) advanceCursor;
/**
 * Move the cursor to @c X and @c Y
 *
 */
- (void) moveTo:(int)x :(int) y;
- (void) moveTo:(Hex_MGPoint)pos;

- (void) empty;

- (void) allocateBuffers;
- (void) deallocateBuffers;

- (void) setDefaultForegroundTo:(unsigned char) default_fg;
- (void) setDefaultBackgroundTo:(unsigned char) default_bg;
- (void) setDefaultIsBoldTo:(bool) isBold;
- (void) setDefaultIsReverseTo:(bool) isReversed;
- (void) setDefaultIsBlinkingTo:(bool) isBlinking;
- (void) setDefaultAttributeSet:(Hex_Char) new_attr;

- (Hex_Char *) defaultAttributeSet;

- (int) x;
- (int) y;

@end

#endif
