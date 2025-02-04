# Webpage
http://localhost:8080

### Powershell command to run
`docker-compose down; docker-compose build --progress plain --no-cache; docker-compose up -d`

### Open container
`docker-compose run --rm wasm-app bash`

### Rebuild components in side the container
```
cd /app
emcc -g -O0 -s WASM=1 -o /built_files/output.js source.cpp
```

### Prerequisites 
- docker
