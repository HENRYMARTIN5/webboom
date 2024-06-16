<img src="https://github.com/ianmethyst/webboom/raw/emscripten/prboom2/emscripten/logo.png" alt="WebBoom logo" style="width: 250px;" />

WebBoom is a [WebAssembly](https://webassembly.org/) port of Doom based on [PrBoom+](http://prboom-plus.sourceforge.net/).

[Play it now](https://webboom.surge.sh)

## Goals

- Remain compatible with [upstream](https://github.com/coelckers/prboom-plus) by changing as little as possible in the codebase/build scripts, which enables WebBoom to:
  - be compiled for desktop and WebAssembly targets
  - incorporate changes made to the original PrBoom+ after this fork was created
- Retain all singleplayer core features, including sound/music
- Keep the git history intact and provide documentation on how to compile the project

## Compiling

### Prerequisites

This project uses Emscripten as its compiler toolchain. To install it, follow [this instructions](https://emscripten.org/docs/getting_started/downloads.html) and activate the **2.0.30** version.

[CMake](https://cmake.org/download/) is needed to generate and run the build scripts, so go ahead and install that too.

### Bulding for WebAssembly

A build script is provided to simplify the process. To compile the project, run the following command:

```sh
./build.sh
```

This will generate the neccesary files in the `prboom2` directory. To serve the website, you can use the following command:

```sh
./serve.sh
```

#### Differences between release and debug builds

Switching between `"Release"` and `"Debug"` in `CMAKE_BUILD_TYPE` affect some defaults flags:

| Type of release | Optimization | Output name | Output suffix | Other flags |
| --------------- | ------------ | ----------- | ------------- | ----------- |
| **Debug** | `-O0` (No optimization) | `index` | `.html` | `-gsource-maps --source-map-base /`. (Emit source maps. This will only work if the website is served from the `prboom2` directory)
| **Release** | `-Oz` (Optimize the code with focus on size) | `prboom` | `.js` | None |

## Similar projects

The following projects served as inspiration for WebBoom:

| Project                                                               | Description | Play it |
|-----------------------------------------------------------------------|-------------|---------|
| [WebAssembly Doom](https://github.com/lazarv/wasm-doom)               | Based on Chocolate Doom/early Crispy Doom, and maybe other projects (git history erased). | [WadCommander](https://wadcmd.com/) |
| [Chocolate Doom WebAssembly](https://github.com/cloudflare/doom-wasm) | Based on Chocolate Doom with [multiplayer reimplementation](https://blog.cloudflare.com/doom-multiplayer-workers/) and no music. | [Silent Space Marine](https://silentspacemarine.com/) |
| [SDLDoom.wasm](https://github.com/Lorti/sdldoom.wasm)                 | Based on SDLDoom, one of the earliest source ports. | No link available |
| [1997 DooM to WebAssembly from Scratch](https://github.com/diekmann/wasm-fizzbuzz/tree/main/doom) | Based on LinuxDoom (original source code released). Has good documentation on the porting process and doesn't use [Emscripten](https://emscripten.org/) | [DooM](https://diekmann.github.io/wasm-fizzbuzz/doom/) |

## Todo

- [ ] Persist saves and settings
- [ ] Joystick support
- [ ] Improve UX
- [ ] Multiplayer?
