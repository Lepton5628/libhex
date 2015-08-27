#include <UI/Impl/Impl.h++>
#include <UI/Impl/Base.h++>

#include <cstdio>
#include <cstdlib>

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

+ (void) setRawMode:(bool) useRawMode {
    perror("setRawMode called on abstract class Hex_UIImplementation_Base");
    exit(1);
}

+ (void) UIDidFinishLaunching {
    perror("UIDidFinishLaunching called on abstract class Hex_UIImplementation_Base");
    exit(1);
}
+ (void) UIWillTerminate {
    perror("UIWillTerminate called on abstract class Hex_UIImplementation_Base");
    exit(1);
}

- (id) init {
    // Does nothing, 'cause called by children
    self = [super init];
    
    return self;
}

- (void) measureOutput {
    perror("measureOutput called on abstract class Hex_UIImplementation_Base");
    exit(1);
}

- (void) refresh {
    perror("refresh called on abstract class Hex_UIImplementation_Base");
    exit(1);
}
- (void) clear {
    perror("clear called on abstract class Hex_UIImplementation_Base");
    exit(1);
}

- (char) getCharacter {
    perror("getCharacter called on abstract class Hex_UIImplementation_Base");
    exit(1);
}
- (void) getString:(char *) buffer withLength:(int) length {
    perror("getString called on abstract class Hex_UIImplementation_Base");
    exit(1);
}

- (void) UIWindowSizeDidChange {
    // Children may or MAY NOT implement this (note: autocalled)
//    perror("UIWindowSizeDidChange called on abstract class Hex_UIImplementation_Base");
//    exit(1);
}

@end