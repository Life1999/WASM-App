### Webpage
Github Pages: https://life1999.github.io/WASM-App/

Local: http://localhost:8080

### Powershell command to run
`docker-compose down; docker-compose build --progress plain --no-cache; docker-compose up -d`

### Open container
`docker-compose run --rm wasm-app bash`

### Rebuild components in side the container
```
cd /built_files
cmake /app -DCMAKE_TOOLCHAIN_FILE=/emsdk/upstream/emscripten/cmake/Modules/Platform/Emscripten.cmake && make
```


### Prerequisites 
- docker
