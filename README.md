# Hacklike Engine eXtended

This is an Objective-C++ library for roguelike development. For a list of features, see [the Features Page](doc/Features.md).  

Note: For anyone wondering, this library does NOT rely on anything related to Mac OS X or Apple.

# Building

### For those on Macintoshes, like me

 0. Get Xcode, and make sure you have `clang` or `gcc 4.6+`. (Note: Not I only tested it for `clang`)

 1. Open Terminal.app (C'mon, you should know this)

 2. Run this command:

`./make`

 3. If does not compile, please send me a bug report. If it's something about GCC, or you're using OS X <= 10.9, I might not be able to help, so you may have to do some patching. I only have `clang` on 10.10.1, and there is only so much I can do without admin.

 4. If the compile was successful, there should be a libhex.a in the build directory.

 5. Run this command:

`install <directory-to-install-to>`

 6. If you get any permissions problems with step 5, then try using `sudo ./install <directory-to-install-to>` (Requires admin)

 7. Now you should have the header files in `<directory-to-install-to>/include`, and `libhex.a` in `<directory-to-install-to>/lib`

### For those on Linux/Unix

 0. Make sure you have `clang` or `gcc 4.6+`.

 1. Get the GNU Objective-C runtime.

 2. Build it. If you do not have administrator privileges, then you will have to add `<directory-you-installed-the-gnu-objective-c-runtime-headers-to>` to the `$INCLUDE` variable in `./make`, and add `<directory-you-installed-the-gnu-objective-c-runtime-libraries>` to the `$LIB` variable in `./make`.

 3. Add `-lobjc` to `$CCFLAGS` in `./make`.

 4. Run:

`./make`

 5. If you encounter any errors, post a bug report. I may or may not be able to help you.

 6. Run:

`./install <directory-to-install-to>`

 7. Now you should have the header files in `<directory-to-install-to>/include`, and `libhex.a` in `<directory-to-install-to>/lib`