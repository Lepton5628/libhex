// -*- mode:objective-c -*-

//
//  ioctl.h
//  libhex
//
//  Created by Max C on 8/23/15.
//  Copyright (c) 2015 Max C. All rights reserved.
//

#include <sys/ioctl.h>
#include <stdio.h>
#include <unistd.h>

int main(){
    struct winsize sz;
    
    ioctl(STDOUT_FILENO, TIOCGWINSZ, &sz);
    
    return 0;
}