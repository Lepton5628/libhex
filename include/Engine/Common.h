//
//  Common.h
//  libhex
//
//  Created by Max C on 8/23/15.
//  Copyright (c) 2015 Max C. All rights reserved.
//

#ifndef LIBHEX_Engine_Common_h
#define LIBHEX_Engine_Common_h

# include <Objc/Objc.h>
# include <Objc/Objc-Runtime.h>
# include <Objc/Objc-Api.h>

#if defined(__APPLE__) && defined(__MACH__)
# import <Foundation/NSObject.h>
# define HEX_ROOT_CLASS NSObject
#else
# define HEX_ROOT_CLASS Object
#endif

@interface HexObject : HEX_ROOT_CLASS {
    int __hex_references;
}

- (id) retain;
- (id) release;

@end

#endif
