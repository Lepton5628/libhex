//WITH_FLAGS (-framework cocoa)

#if defined(__APPLE__) && defined(__MACH__)

#include <UI/Impl/Cocoa.h>

#import <Cocoa/Cocoa.h>
#import <AppKit/AppKit.h>

@implementation Hex_UIImplementation_Cocoa_View

- (void) drawRect:(NSRect) dirtyRect {
    
}
- (void) setHexState:(Hex_M_UIOutputBuffer *) state {
    
}

@end

@implementation Hex_UIImplementation_Cocoa

static id<Hex_UIImplementation> my_instantiation;
static NSApplication* App;

+ (void) initialize {
    static bool am_i_initialized = false;
    App = [NSApplication sharedApplication];
    
    if(!am_i_initialized){
        am_i_initialized = true;
        my_instantiation = [[self alloc] init];
    }
}

+ (id<Hex_UIImplementation>) getInstance {
    return my_instantiation;
}

- (void) setWindowSize:(NSRect) nsize {
    _windowSize = nsize;
}

- (NSRect) windowSize {
    return _windowSize;
}

- (id) init {
    self = [super init];
    if(self){
    }
    return self;
}

+ (void) UIDidFinishLaunching {
    [NSApplication sharedApplication];
    [App setActivationPolicy:NSApplicationActivationPolicyRegular];
    
    NSMenu *hex_mainmenu = [[NSMenu new] autorelease];
    NSMenuItem *hex_appMenuItem = [[NSMenuItem new] autorelease];
    
    [hex_mainmenu addItem:hex_appMenuItem];
    
    [App setMainMenu:hex_mainmenu];
    
    NSMenu *hex_appMenu = [NSMenu new];
    NSString *hex_appName = [[NSProcessInfo processInfo] processName];
    NSString *hex_quitName = [@"Quit " stringByAppendingString:hex_appName];
    
    NSMenuItem *hex_quitItem = [[NSMenuItem alloc] initWithTitle:hex_quitName action:@selector(terminate:) keyEquivalent:@"q"];
    [hex_appMenu addItem:hex_quitItem];
    [hex_appMenuItem setSubmenu:hex_appMenu];
    
    Hex_UIImplementation_Cocoa *impl = (Hex_UIImplementation_Cocoa *)[self getInstance];
    
    [impl setWindowSize:NSMakeRect(0, 0, 200, 200)];
    impl.window = [[NSWindow alloc] initWithContentRect:[impl windowSize] styleMask:NSTitledWindowMask backing:NSBackingStoreBuffered defer:NO];
    [impl.window setStyleMask:NSTitledWindowMask|NSResizableWindowMask|NSClosableWindowMask|NSMiniaturizableWindowMask];
    [impl.window cascadeTopLeftFromPoint:NSMakePoint(20,20)];
//    [impl.window.contentView addSubView: [impl view]];
    [impl.window setTitle:hex_appName];
    [impl.window makeKeyAndOrderFront:nil];
    [NSMenu setMenuBarVisible:YES];
    [App setPresentationOptions:NSApplicationPresentationFullScreen];
    [App activateIgnoringOtherApps:YES];
    [App run];
    return;
}

@end

#endif