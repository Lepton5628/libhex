---
layout: incldue
title: 
permalink: /docs/build-osx/
---
0. Get Xcode, and make sure you have `clang` or `gcc 4.6+`. (Note: Not I only tested it for `clang`)

1. Download the sources:
   ```
   git clone git@github.com:cmura81/libhex.git
   ```

2. Run this command:
   ```
   ./make
   ```

3. If does not compile, please send me a bug report. If it's something about GCC, or you're using OS X <= 10.9, I might not be able to help, so you may have to do some patching. I only have `clang` on 10.10.1 and GCC on 10.4.11 PPC, <strike>and there is only so much I can do without admin</strike>.

4. If the compile was successful, there should be a libhex.a in the build directory.

5. Run this command:
   ```
   ./install <directory-to-install-to>
   ```

6. If you get any permissions problems with step 5, then try using `sudo ./install <directory-to-install-to>` (Requires admin)

7. Now you should have the header files in `<directory-to-install-to>/include`, and `libhex.a` in `<directory-to-install-to>/lib`
