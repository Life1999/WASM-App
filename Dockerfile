# Use the official emscripten image for WebAssembly build
FROM emscripten/emsdk:latest

# Set the working directory inside the container
WORKDIR /app

# Explicitly set the PATH for emcc (if necessary)
ENV PATH="/emsdk/upstream/emscripten:${PATH}"

# Install any necessary dependencies (if required, you can uncomment and adjust the next line)
RUN apt-get update && apt-get install -y cmake

# Copy the source code into the container
COPY . /app

# Ensure the build directory exists
RUN mkdir -p /built_files /app/build

# Set working directory to build files directory
WORKDIR /built_files

# Build the C++ file into WebAssembly (WASM)
# RUN emcc -g -O0 -s WASM=1 -o /built_files/output.js source.cpp
RUN cmake /app -DCMAKE_TOOLCHAIN_FILE=/emsdk/upstream/emscripten/cmake/Modules/Platform/Emscripten.cmake && make

# Ensure that source.cpp is being copied into the container and has the correct permissions
RUN echo "Listing the /app directory contents after COPY:" && ls -lah /built_files

# Expose a port if you want to serve the output with a web server
EXPOSE 8080

# Default command to run (for example, start a simple HTTP server or run the app)
CMD ["python3", "-m", "http.server", "8080", "--directory", "/app"]


