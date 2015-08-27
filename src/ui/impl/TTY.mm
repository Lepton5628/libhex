//
//  TTY.mm
//  libhex
//
//  Created by Max C on 8/23/15.
//  Copyright (c) 2015 Max C. All rights reserved.
//

#import <UI/Impl/TTY.h++>
#import <UI/Attribute.h++>

@implementation Hex_UIImplementation_TTY

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

@synthesize windowSize = windowSize;

+ (void) setRawMode:(bool) useRawMode {
    struct termios *tp = new termios;
    
    tcgetattr(STDIN_FILENO, tp);
    
    if(useRawMode){
/* Solaris doesn't have cfmakeraw, so I put in the cfmakeraw() implementation */
/* The dependency-checker will not die on cfmakeraw() because I only check tcgetattr and tcsetattr. If I am wrong, or someone has changed it, feel free to update the test. */
#if defined(__sun)
        tp->c_iflag &= ~(IMAXBEL|IGNBRK|BRKINT|PARMRK|ISTRIP|INLCR|IGNCR|ICRNL|IXON);
        tp->c_oflag &= ~(OPOST);
        tp->c_lflag &= ~(ECHO|ECHONL|ICANON|ISIG|IEXTEN);
        tp->c_cflag &= ~(CSIZE|PARENB);
        tp->c_cflag |= CS8;
#else
        cfmakeraw(tp);
#endif
    } else {
/* Took a bit of tinkering, but I finally figured out how to reverse cfmakeraw() */
        tp->c_iflag |= (IMAXBEL|IGNBRK|BRKINT|PARMRK|ISTRIP);
        tp->c_oflag |= (OPOST);
        tp->c_lflag |= (ECHO|ECHONL|ICANON|ISIG|IEXTEN);
        tp->c_cflag &= ~(CSIZE);
        tp->c_cflag |= (CS7|PARENB);
    }
    
    tcsetattr(STDIN_FILENO, TCSANOW, tp);
}

+ (void) UISizeDidChange {
    Hex_UIImplementation_TTY *tty = (Hex_UIImplementation_TTY *)[self getInstance];
    
    [tty measureOutput];
    
    [[tty outputBuffer] correspondingOutputDidResizeToDimensions:Hex_MGPoint([tty width], [tty height])];
}

+ (void) UIDidFinishLaunching {
    setlocale(LC_ALL, "");
    
    [Hex_UIImplementation_TTY setRawMode:true];
}

+ (void) UIWillTerminate {
    [Hex_UIImplementation_TTY setRawMode:false];
}

+ (void) UIWindowSizeDidChange {
    Hex_UIImplementation_TTY *tty = (Hex_UIImplementation_TTY *)[self getInstance];
    
    [tty measureOutput];
    
    Hex_MGPoint newDimensions([tty width], [tty height]);
    [[tty outputBuffer] correspondingOutputDidResizeToDimensions: newDimensions];
}

- (id) init {
    self = [super init];
    if(self){
        [self measureOutput];
        
        self.outputBuffer = [[Hex_M_UIOutputBuffer alloc] initWithDimensions:Hex_MGPoint(self.width, self.height)];
    }
    return self;
}

- (void) measureOutput {
    ioctl(STDOUT_FILENO, TIOCGWINSZ, &self->windowSize);
    
    self->width = self->windowSize.ws_col;
    self->height = self->windowSize.ws_row;
}

- (void) refresh {
    Hex_Char **output = [[self outputBuffer] output_buffer];
    bool **change = [[self outputBuffer] change_buffer];
    
    for(int i = 0;i < self->height;i++){
        for(int j = 0;j < self->width;j++){
            if(change[i][j]){
                Hex_Char cc = output[i][j];
                
                printf("\x1b[%i;%iH", i + 1, j + 1);
                
                if(cc.foreground){
                    printf("\x1b[38;5;%im", cc.foreground - 1);
                }
                if(cc.background){
                    printf("\x1b[48;5;%im", cc.background - 1);
                }
                if(cc.bold){
                    printf("\x1b[1m");
                }
                if(cc.blink){
                    printf("\x1b[5m");
                }
                if(cc.reverse){
                    printf("\x1b[7m");
                }
                
                putchar(cc.ascii);
                
                printf("\x1b[0m");
                change[i][j] = false;
            }
        }
    }
}

- (void) clear {
    // self->width + 1 because of newlines. It's always worked for me.
    for(int i = 0;i < (self->height * (self->width + 1));i++){
        /*
         * Not "\b \b" because we only want to move back, and we don't know if that tile has changed. That's what the changebuffer is for.
         */
        printf("\b");
    }
    
    // Put the external cursor at (0,0)
    printf("\x1b[H");
}

- (char) getCharacter {
    // A simple call to getchar()
    // Note: @TODO: Change this to a read call from internal member stdin_fileno (Not the macro) for the socket-swapping web interface.
    return getchar();
}

- (void) getString:(char *) buffer withLength:(int) length {
    // Number of characters in the string.
    int counter = 0;
    // Current Character.
    char cc;
    
    // Loop designed to emulate cooked mode
    while((cc = [self getCharacter]) != '\n'){
        // This needs to be first to check for backspaces before the clause in the next if catches them.
        // If there is something in the string already, we can delete stuff.
        if(counter > 0){
            /* Delete or Backspace */
            if(cc == 8 || cc == 127){
                // We do this first so that counter is still pointing to the current character.
                buffer[counter] = '\0';
                counter--;
                // Go backwards, erase the character w/ a space, and then go backwards again.
                printf("\b \b");
                
                // So we don't fall through to the next if.
                continue;
            }
        }
        // If we aren't at the end of the string yet.
        if(counter < length){
            // If it isn't delete (so we aren't printing weird characters)
            if(cc != 8 && cc != 127){
                // Set the relevant character in the buffer
                buffer[counter] = cc;
                // Increase the character count
                counter++;
                // Output the character
                putchar(cc);
                // Fall through to the next step of the loop.
                continue;
            } else {
                // counter == 0 and key is delete. Print `\a` (bell)
                printf("\a");
                // Fall through to the next step of the loop
                continue;
            }
        } else {
            // If we are here, counter == length, so just plain old print a `\a` (bell) character
            printf("\a");
        }
        
        // If execution reaches here (which SHOULD be impossible)
        // Then the program is corrupted, or the optimization changed the program flow.
        // I would put an error & exit here, except whenever I use one of those, the program tends to somehow, miraculously trigger them. It's annoying as ****.
    }
}

@end