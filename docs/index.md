---
layout: page
title: LibHex Documentation
permalink: /docs/
---

# LibHex

`Libhex` is a roguelike development library written in Objective-C++. (Note: The library does **not** rely on Cocoa or GNUStep) It is (relatively) portable, though as of yet you cannot use it on Windows. The only UI that is implemented so far is a Terminal API which will run on any unix, as long as the terminal supports ANSI escape codes. (Most do)

### Table of Contents

 * [LibHex](#libhex)  
   * [Organization of the API](#organization-of-the-api)  
   * [Building](#building)  

### Organization of the API

The names in the `Libhex` API are all prefixed with `Hex`.  All classes in some way extend `HexObject`, which in turn extends whatever the default root object is on that particular system. (`NSObject` or `Object`).

The API is grouped into several subnamespaces:

 * The **Model** namespace: `Hex_M...`
 * The **UI** namespace: `Hex_UI...`
 * The **Engine** namespace `Hex_E...`

As you can see,  `Libhex` follows the `MVC` pattern quite strictly.

Each namespace may have yet **more** subnamespaces, such as `Hex_MG...` for geometry, and `Hex_ED...`  for the dungeon generators.

### Building

<!-- Always the latest version -->
<script src="https://code.jquery.com/jquery.min.js"></script>
<script>
// Thx, http://stackoverflow.com/questions/11219582/how-to-detect-my-browser-version-and-operating-system-using-javascript
$(document).ready(function(){var OSName="Unknown OS";
if (navigator.appVersion.indexOf("Mac")==-1){
    $('.build-instructions').load("/docs/build-osx");
} else {
    $('.build-instructions').load("/docs/build-unix");
    if(navigator.appVersion.indexOf("Win")==-1){
        $('.build-win-instructions').load("/docs/build-win");
    }
}});
</script>

<div class='build-win-instructions'>

</div>
<div class='build-instructions'>

</div>
