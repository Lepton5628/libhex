#include <Model/OutputBuffer.h++>
#include <stdio.h>

@implementation Hex_M_UIOutputBuffer

- (id) initWithDimensions:(Hex_MGPoint) dimensions {
    self = [super init];
    
    self.width = dimensions.x;
    self.height = dimensions.y;
    
    [self allocateBuffers];
    [self setDefaultAttributeSet: 0];
    [self setDefaultForegroundTo: 16];
    [self setDefaultBackgroundTo: 1];
    [self setDefaultIsBoldTo: 0];
    [self setDefaultIsBlinkingTo: 0];
    [self setDefaultIsReverseTo: 0];
    
    [self setX: 0];
    [self setY: 0];
    
    return self;
}

- (void) allocateBuffers {
    self.output_buffer = new Hex_Char*[self.height];
    self.change_buffer = new bool*[self.height];
    for(int i = 0;i < self.height;i++){
        self.output_buffer[i] = new Hex_Char[self.width];
        self.change_buffer[i] = new bool[self.width];
    }
    
    [self empty];
}

- (void) deallocateBuffers {
    for(int i = 0;i < self.height;i++){
        delete [] self.output_buffer[i];
        delete [] self.change_buffer[i];
    }
    delete [] self.output_buffer;
    delete [] self.change_buffer;
}

- (void) addChar:(Hex_Char) chr {
    if(chr.foreground == 0)
        chr.foreground = [self defaultAttributeSet]->foreground;
    if(chr.background == 0)
        chr.background = [self defaultAttributeSet]->background;

    self.change_buffer[self.y][self.x] = true;
    self.output_buffer[self.y][self.x] = chr;
    
    [self advanceCursor];
}

- (void) addChar:(Hex_Char) chr atPosition:(Hex_MGPoint) pos {
    [self moveTo:pos];
    [self addChar:chr];
}

- (void) addString:(char *) str {
    for(int i = 0;i < strlen(str);i++){
        [self addChar:str[i]];
    }
}

- (void) addString:(char *) str atPosition:(Hex_MGPoint) pos {
    [self moveTo:pos.x:pos.y];
    for(int i = 0;i < strlen(str);i++){
        [self addChar:str[i]];
    }
}

- (Hex_Char) getChar {
    return self.output_buffer[[self y]][[self x]];
}

- (Hex_Char) getCharAtPosition:(Hex_MGPoint) pos {
    return self.output_buffer[pos.y][pos.x];
}

- (void) empty {
    for(int i = 0;i < self.height;i++){
        for(int j = 0;j < self.width;j++){
            self.output_buffer[i][j] = ' ';
            self.change_buffer[i][j] = true;
        }
    }
}

- (void) advanceCursor {
    int lx = [self x], ly = [self y];
    
    lx++;
    if(lx >= [self width]){
        lx = 0;
        ly++;
        
        if(ly >= [self height]){
            ly = 0;
        }
    }
    [self moveTo:lx :ly];
}
    
- (void) moveTo:(Hex_MGPoint) pos {
    [self moveTo:pos.x:pos.y];
}

- (void) moveTo:(int)newx :(int) newy {
    self.x = newx;
    self.y = newy;
    if(self.x >= [self width])
        self.x = [self width] - 1;
    else if(self.x < 0)
        self.x = 0;
    
    if(self.y >= [self height])
        self.y = [self height] - 1;
    else if(self.y < 0)
        self.y = 0;
}

- (int) setX:(int) newX {
    return x = newX;
}

- (int) setY:(int) newY {
    return y = newY;
}

- (int) x {
    return x;
}

- (int) y {
    return y;
}

- (void) setDefaultAttributeSet:(Hex_Char) new_attr {
    defaultAttributeSet = new Hex_Char(new_attr);
}
- (Hex_Char *) defaultAttributeSet {
    return defaultAttributeSet;
}

- (void) setDefaultForegroundTo:(unsigned char) default_fg {
    [self defaultAttributeSet]->foreground = default_fg;
}
- (void) setDefaultBackgroundTo:(unsigned char) default_bg {
    [self defaultAttributeSet]->background = default_bg;
}
- (void) setDefaultIsBoldTo:(bool) isBold {
    [self defaultAttributeSet]->bold = isBold;
}
- (void) setDefaultIsReverseTo:(bool) isReversed {
    [self defaultAttributeSet]->reverse = isReversed;
}
- (void) setDefaultIsBlinkingTo:(bool) isBlinking {
    [self defaultAttributeSet]->blink = isBlinking;
}
- (void) correspondingOutputDidResizeToDimensions:(Hex_MGPoint) size {
    [self deallocateBuffers];

    self.width = size.x;
    self.height = size.y;
    [self allocateBuffers];
}

- (void) setForegroundTo:(unsigned char) fg atPosition:(Hex_MGPoint) pos {
    [self output_buffer][pos.y][pos.x].foreground = fg;
}

- (void) setBackgroundTo:(unsigned char) bg atPosition:(Hex_MGPoint) pos {
    [self output_buffer][pos.y][pos.x].background = bg;
}

- (void) setIsBoldTo:(bool) bold atPosition:(Hex_MGPoint) pos {
    [self output_buffer][pos.y][pos.x].bold = bold;
}

- (void) setIsReverseTo:(bool) reverse atPosition:(Hex_MGPoint) pos {
    [self output_buffer][pos.y][pos.x].reverse = reverse;
}

- (void) setIsBlinkingTo:(bool) blinking atPosition:(Hex_MGPoint) pos {
    [self output_buffer][pos.y][pos.x].blink = blinking;
}

- (Hex_Char) getAttributesAtPosition:(Hex_MGPoint) pos {
    return [self output_buffer][pos.y][pos.x];
}

@end
