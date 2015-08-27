////
////  Cocoa.h
////  libhex
////
////  Created by Max C on 8/26/15.
////  Copyright (c) 2015 Max C. All rights reserved.
////
//
//#ifndef libhex_Cocoa_h
//#define libhex_Cocoa_h
//
//#if defined(__APPLE__) && defined(__MACH__)
//
//#include <UI/Impl/Base.h>
//#include <UI/Impl/Impl.h>
//#include <UI/Attribute.h>
//#include <Model/OutputBuffer.h>
//#include <Model/Geometry/Point.h>
//
//#import <Foundation/Foundation.h>
//
//#import <Cocoa/Cocoa.h>
//#import <Appkit/Appkit.h>
////#import <UIKit/UIKit.h>
//
//#if UI_TARGET==UI_TARGET_IPHONE
//# define UI_COCOA_PREFIX UI
//#else
//# define UI_COCOA_PREFIX NS
//#endif
//// __VA_ARGS__ prevents macros from stalling
//// Workaround for macro expansion blocking
//#define UI_CONCAT_INDIRECT(a, ...) __VA_ARGS__##a
//// Adapts to both iPhone & Cocoa APIs by switching prefixes
//#define UI_COCOA(n) UI_CONCAT_INDIRECT(n, UI_COCOA_PREFIX)
//
//@interface Hex_UIImplementation_Cocoa_Window : NSWindow
//
//- (id) initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)aStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag;
//
//@end
//
//@interface Hex_UIImplementation_Cocoa_View : NSView {
//    Hex_M_UIOutputBuffer *state;
//}
//
//- (void) drawRect:(NSRect)dirtyRect;
//- (void) setHexState:(Hex_M_UIOutputBuffer *) state;
//- (Hex_M_UIOutputBuffer *) state;
//
//@end
//
//@interface Hex_UIImplementation_Cocoa : Hex_UIImplementation_Base<Hex_UIImplementation> {
//    NSRect _windowSize;
//}
//
//@property (strong, atomic, readwrite) NSWindow *window;
//@property (strong, atomic, readwrite) Hex_UIImplementation_Cocoa_View *view;
//
//- (void) setWindowSize:(NSRect) nsize;
//- (NSRect) windowSize;
//
//+ (void) setRawMode:(bool) useRawMode;
//
//+ (void) UIDidFinishLaunching;
//+ (void) UIWillTerminate;
//
//+ (void) UIWindowSizeDidChange;
//
//- (id) init;
//
//- (void) measureOutput;
//
//- (void) refresh;
//- (void) clear;
//
//- (char) getCharacter;
//- (void) getString:(char *) buffer withLength:(int) length;
//
//@end
//
//
//#endif
//#endif
