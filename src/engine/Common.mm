#include <Engine/Common.h>

@implementation HexObject

- (id) retain {
    self->__hex_references++;
    
    return self;
}

- (id) release {
    if((--self->__hex_references) <= 0){
        [self dealloc];
        self = nil;
        
        return nil;
    } else {
        return self;
    }
}

@end