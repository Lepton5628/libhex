#include <UI/Impl/TTY.h>
#include <UI/UI.h>

Hex_UIInterface *io;

int main(){
    [Hex_UIInterface setRawMode: true];
    
    io = [Hex_UIInterface getInstance];
    
    [io clear];
    [io refresh];
    
    [io getCharacter];
    
    [Hex_UIInterface setRawMode: false];
}