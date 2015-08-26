//
//  termios.c
//  libhex
//
//  Created by Max C on 8/23/15.
//  Copyright (c) 2015 Max C. All rights reserved.
//

#include <stdio.h>
#include <termios.h>
#include <unistd.h>

/* Macro checks */
#ifdef STDIN_FILENO
# ifdef STDOUT_FILENO

int main(){
    
    struct termios tp;
    
    tcgetattr(STDIN_FILENO, &tp);
    
    tcsetattr(STDIN_FILENO, TCSANOW, &tp);
    
    return 0;
}

# else
#  error "unistd.h" does not define STDOUT_FILENO
# endif
#else
# error "unistd.h" does not define STDIN_FILENO
#endif