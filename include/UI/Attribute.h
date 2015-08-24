//
//  Attribute.h
//  libhex
//
//  Created by Max C on 8/23/15.
//  Copyright (c) 2015 Max C. All rights reserved.
//

#ifndef LIBHEX_UI_Attribute_h
#define LIBHEX_UI_Attribute_h

#include <Engine/Common.h>

/**
 * @brief Container for a single character on the UI.
 *
 * @MVC-Role: Model
 */
struct Hex_Char {
    Hex_Char(){}
    
    Hex_Char(char a){
        this->ascii = a;
    }
    
    /**
     * Set foreground color.
     */
    void operator-=(int a){
        this->foreground = a;
    }
    
    /**
     * Set background color.
     */
    void operator+=(int a){
        this->background = a;
    }
    
    /**
     * Set bold text.
     */
    void operator*=(int a){
        this->bold = (bool)a;
    }
    
    /**
     * Set reverse video.
     */
    void operator/=(int a){
        this->reverse = (bool)a;
    }
    
    /**
     * The ascii value of the character.
     */
    unsigned long long ascii          : 8;
    /**
     * The foreground color of the character.
     *
     * @see Color_rgb
     * @see Color_greyscale
     */
    unsigned long long foreground     : 8;
    /**
     * The background color of the character.
     *
     * @see Color_rgb
     * @see Color_greyscale
     */
    unsigned long long background     : 8;

    /**
     * Flag that specifies whether character is bold.
     */
    unsigned long long bold           : 1;
    /**
     * Flag that specifies whether character is blinking.
     */
    unsigned long long blink          : 1;
    /**
     * Flag that specifies whether character is in reverse video mode.
     */
    unsigned long long reverse        : 1;
    /**
     * @internal
     * Padding
     */
    unsigned long long flag_pad       : 5;
    
    /**
     * Aliases for UTF-8 output.
     */
    unsigned long long unicode_alias  : 8;
    
    /**
     * @internal
     * Padding
     */
    unsigned long long struct_pad : 24;
};

typedef struct Hex_Char Hex_Char;

#endif
