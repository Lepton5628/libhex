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
        this->foreground = 0;
        this->background = 0;
        this->bold = false;
        this->reverse = false;
        this->blink = false;
        this->unicode_alias = 0;
    }
    
    Hex_Char(char a, unsigned char fg, unsigned char bg){
        this->ascii = a;
        this->foreground = fg;
        this->background = bg;
        this->bold = false;
        this->reverse = false;
        this->blink = false;
        this->unicode_alias = 0;
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

    operator int(){
        unsigned long long result = this->ascii;
        result |= (foreground << 8);
        result |= (background << 16);
        result |= (bold << 24);
        result |= (blink << 25);
        result |= (reverse << 26);
// Jis' padding = expendable
//        result |= (flag_pad << 31);
        result |= (unicode_alias << 32);
// Jis' padding = expendable
//        result |= (struct_pad << 40);
        return result;
    }

    void operator|=(struct Hex_Char x){
        return this->operator|=((int)x);
    }

    void operator|=(int x){
        this->ascii |= (x & 0xFF);
        this->foreground |= (x & 0xFF00) >> 8;
        this->background |= (x & 0xFF0000) >> 16;
        this->bold |= (x & 0x1000000) >> 24;
        this->blink |= (x & 0x2000000) >> 25;
        this->reverse |= (x & 0x4000000) >> 26;
// Not gonnae do flag pad, 'cause it's liable to change lateah.
        this->unicode_alias |= (x & 0xFF00000000) >> 32;
// 'Jis padding = expendable
//      this->struct_pad |= (x &FFFFFF00000000) >> 40;
    }

    void operator&=(int x){
        this->ascii &= (x & 0xFF);
        this->foreground &= (x & 0xFF00) >> 8;
        this->background &= (x & 0xFF0000) >> 16;
        this->bold &= (x & 0x1000000) >> 24;
        this->blink &= (x & 0x2000000) >> 25;
        this->reverse &= (x & 0x4000000) >> 26;
// Not gonnae do flag pad, 'cause it's liable to change lateah.
        this->unicode_alias &= (x & 0xFF00000000) >> 32;
// 'Jis padding = expendable
//      this->struct_pad &= (x &FFFFFF00000000) >> 40;
    }

    void operator=(int x){
        this->ascii = (x & 0xFF);
        this->foreground = (x & 0xFF00) >> 8;
        this->background = (x & 0xFF0000) >> 16;
        this->bold = (x & 0x1000000) >> 24;
        this->blink = (x & 0x2000000) >> 25;
        this->reverse = (x & 0x4000000) >> 26;
// Not gonnae do flag pad, 'cause it's liable to change lateah.
        this->unicode_alias = (x & 0xFF00000000) >> 32;
// 'Jis padding = expendable
//      this->struct_pad = (x &FFFFFF00000000) >> 40;
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

@interface HexColor : HexObject

+ (unsigned char) colorWithR:(char)r G:(char)g B:(char)b;
+ (unsigned char) colorWithRGB:(char)r :(char)g :(char)b;
+ (unsigned char) colorWithGreyscale:(char)g;

@end

#endif
