---
layout: incldue
title:
permalink: /docs/build-unix/
---
 0. Make sure you have `clang` or `gcc 4.6+`.

 1. Get the GNU Objective-C runtime.

 2. Build it. If you do not have administrator privileges, then you will have to add `<directory-you-installed-the-gnu-objective-c-runtime-headers-to>` to the `$INCLUDE` variable in `./make`, and add `<directory-you-installed-the-gnu-objective-c-runtime-libraries>` to the `$LIB` variable in `./make`.

 3. Add `-lobjc` to `$CCFLAGS` in `./make`.

 4. Run:
    ```
    ./make
    ```

 5. If you encounter any errors, post a bug report. I may or may not be able to help you.

 6. Run:
    ```
    ./install <directory-to-install-to>
    ```

 7. Now you should have the header files in `<directory-to-install-to>/include`, and `libhex.a` in `<directory-to-install-to>/lib`
