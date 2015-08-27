# LibHex's Mission

`LibHex` was written with the sole intention of making roguelike development
easier, by providing a library with a low learning curve. (Alright, I may have
harvested it from my roguelike [Myriad](http://cmura81.github.io/myriad)), but
that is it's intention nonetheless.

### Specifics

`LibHex` is written in Objective-C++, which enables you to interface it with
C, C++, and really any language which can bridge to C/C++. It is designed to be
as portable as possible, and does not rely on any single operating system.
Any part of the code which is dependent on some non-standard external mechanism
is abstracted, and usually follows the `Polymorphism` pattern, which means you
never have to deal with platform-dependent code directly by hiding the implementation behind a
superclass or interface/protocol.

### Contributing

See [Contributing](contributing) for more.
