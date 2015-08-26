#include <Model/OutputBuffer.h>

@implementation Hex_M_UIOutputBuffer

- (id) initWithDimensions:(Hex_MGPoint) dimensions {
    self = [super init];
    
    self.width = dimensions.x;
    self.height = dimensions.y;
    
    [self allocateBuffers];
    [self setDefaultAttributeSet: 0];
    
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
    if(!((int)chr & 0xFFFFFFFFFFFFFF00)){
        
    }
    self.change_buffer[self.y][self.x] = true;
    self.output_buffer[self.y][self.x] = chr;
    
    [self advanceCursor];
}

- (void) addChar:(Hex_Char) chr atPosition:(Hex_MGPoint) pos {
    [self moveTo:pos];
    [self addChar:chr];
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
    [self moveTo:lx :ly];goto <#label#>
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
- (void) setDefaultForegroundColor:(unsigned char) default_fg {
    [self defaultAttributeSet]->foreground = default_fg;
}
- (void) setDefaultBackgroundColor:(unsigned char) default_bg {
    [self defaultAttributeSet]->background = default_bg;
}
- (void) setDefaultIsBold:(bool) isBold {
    [self defaultAttributeSet]->bold = isBold;
}
- (void) setDefaultIsReversedVideo:(bool) isReversed {
    [self defaultAttributeSet]->reverse = isReversed;
}
- (void) setDefaultIsBlinking:(bool) isBlinking {
    [self defaultAttributeSet]->blink = isBlinking;
}

@end