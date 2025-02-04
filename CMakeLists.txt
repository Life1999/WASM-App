cmake_minimum_required(VERSION 3.0)
project(MyWasmApp)

# Enable WebAssembly output with Emscripten
if (CMAKE_SYSTEM_NAME STREQUAL "Emscripten")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -s WASM=1 -s EXPORTED_FUNCTIONS='[_main]' -s MODULARIZE=1 -s EXPORT_ES6=1")
endif()

# Set output directory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY /built_files)

# Add executable target
add_executable(output src/main.cpp)

# Specify the output format (JS and WASM)
set_target_properties(output PROPERTIES LINK_FLAGS "-o /built_files/output.js")
