#include <Model/OutputBuffer.h>

@implementation Hex_M_UIOutputBuffer

- (id) initWithDimensions:(Hex_MGPoint) dimensions {
    self = [super init];
    
    [self setWidth: dimensions.x];
    [self setHeight: dimensions.y];
    
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
    if(!((int) chr & 0xFFFFFFFFFFFFFF00)){
        self.change_buffer[self.y][self.x] = true;
        self.output_buffer[self.y][self.x] = chr;
    }
    
    [self advanceCursor];
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
    
}

@end