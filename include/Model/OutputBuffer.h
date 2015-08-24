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

@interface Hex_M_UIOutputBuffer {
    Hex_Char **output_buffer;
    bool **change_buffer;
    
    int width, height;
    
    int x, y;
}

/*
 * Size is immutable.
 */
@property (atomic, readonly) int width, height;

/*
 * Since these are pointers, they can be readonly.
 */
@property (atomic, readonly) Hex_Char **output_buffer;
@property (atomic, readonly) bool **change_buffer;

@property (atomic, readwrite) int x;
@property (atomic, readwrite) int y;

- (id) initWithDimensions:(Hex_MGPoint) dimensions;

- (void) addChar:(Hex_Char) chr;
- (void) addChar:(Hex_Char) chr withAttributes:(Hex_Char) attributes;
- (void) addChar:(Hex_Char) chr atPosition:(Hex_MGPoint) pos;
- (void) addChar:(Hex_Char) chr withAttributes:(Hex_Char) attributes atPosition:(Hex_MGPoint)pos;

- (Hex_Char) getChar;
- (Hex_Char) getCharAtPosition:(Hex_MGPoint) pos;

- (void) addString:(char *) str;
- (void) addString:(char *) str withAttributes:(Hex_Char) attributes;
- (void) addString:(char *) str atPosition:(Hex_MGPoint) pos;
- (void) addString:(char *) str withAttributes:(Hex_Char) attributes atPosition:(Hex_MGPoint) pos;

- (void) moveTo:(Hex_MGPoint) pos;

- (void) allocateBuffers;
- (void) deallocateBuffers;

- (void) correspondingOutputDidResizeToDimensions:(Hex_MGPoint) size;

- (void) setAttributesAtPosition:(Hex_MGPoint) pos to:(Hex_Char)new_attr;
- (void) getAttributesAtPosition:(Hex_MGPoint) pos to:(Hex_Char)new_attr;

@end

#endif
