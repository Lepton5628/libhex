//
//  arc4random.c
//  libhex
//
//  Created by Max C on 8/23/15.
//  Copyright (c) 2015 Max C. All rights reserved.
//

#include <stdlib.h>
#include <stdio.h>

int main(){
    arc4random_stir();
    
    int a = arc4random();
    
    if(arc4random_uniform(a) < a){
        return 0;
    } else return 1;
}
