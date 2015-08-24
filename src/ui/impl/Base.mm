#include <UI/Impl/Impl.h>

@implementation Hex_UIImplementation_Base

@synthesize x = x;
@synthesize y = y;

@synthesize width = width;
@synthesize height = height;

@synthesize outputBuffer = outputBuffer;

static id<Hex_UIImplementation> my_instantiation = nil;

+ (void) initialize {
    static bool am_i_instantiated = false;
    
    if(!am_i_instantiated){
        am_i_instantiated = true;
        my_instantiation = [[self alloc] init];
    }
}

+ (id<Hex_UIImplementation>) getInstance {
    /* Because + (void) initialize has already been called by libobjc, it will return the single instance */
    return my_instantiation;
}

@end