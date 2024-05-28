# vulkan-triangle

> [!WARNING]
> Work in Progress

## About

This is a WIP vulkan triangle application. I am following the online tutorial resource, [Vulkan Tutorial](https://vulkan-tutorial.com).

### Dependencies
- [`GLFW`](https://github.com/glfw/glfw): Window creation
- [`ImGui`](https://github.com/ocornut/imgui): Lightweight dev gui
- [`GLM`](https://github.com/g-truc/glm): C++ Math library

_All of these are available through git submodules. Instructions are below._

---

## Setup

### Build Requirements
- [`cmake`](https://cmake.org): 3.20+
- a modern C++20 compiler: todo update versions:(`gcc-8`, `clang-6.0`, `MSVC 2017` or above)

> [!NOTE]
> I've only tested building and running using MSVC compiler and Visual Studio CMake generator.

---

### Build via Command-Line
- Clone this project using git.
- From the root of this project update all the submodules with `git submodule update --init --recursive`.
- Follow the command-line instructions below:

  ```
  cmake . -B build ${OPTIONS}
  cmake --build build
  ```

#### ${OPTIONS}
Use `-G ${GENERATOR}` to use a specific [build system](https://cmake.org/cmake/help/latest/manual/cmake-generators.7.html) (e.g. `"Unix Makefiles"`, `"Visual Studio 17 2022"`, etc.).

#### Run
Execute either `./build/src/app` (linux/macOS/MinGW) or `build/src/Debug/app.exe` (MSVC).

---

### Build via CMake Compatible IDE

- Clone this project using git.
- From the root of this project update all the submodules with `git submodule update --init --recursive`
- Open the project in an editor that directly supports CMake files.

Configure the CMake toolchain to your desired choice.

Reload your CMake project.

---

## Project Structure
- `build`: Generated build files and binary application.
- `data`: Screenshots and other data.
- `docs`: Personal notes, documentation, and examples.
- `external`: External dependencies (e.g. git submodules).
- `resources`: Project resources such as shaders, textures, sounds, music, etc.
- `src`: Source code

---
