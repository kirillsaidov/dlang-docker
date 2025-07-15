# D Docker Containers

<img src="https://tour.dlang.org/static/img/tour/dman.png" height="200"/>

Prebuilt Docker-based toolchains for compiling, building, and running [D language](https://dlang.org) projects. Useful as base images for CI/CD pipelines, development environments, or containerized builds.

## Docker
* [Dockerhub](https://hub.docker.com/r/kirillsaidov/dlang)
* [Dockerfiles](https://github.com/kirillsaidov/dlang-docker)

## Available Images

All images are based on `ubuntu:24.04` and include the DMD/LDC2 compiler, `dub`, and `rdmd`, ready to use out of the box.

### DMD

| Image Tag         | Description                        | Link       |
| ----------------- | ---------------------------------- | ---------- |
| `dmd-latest`      | Latest DMD compiler + dub + rdmd   | [link](https://hub.docker.com/layers/kirillsaidov/dlang/dmd-latest/images/sha256-ae7a9caf1cd7b06547261a12aaa3dd4e572ddeaa76e71d4855760d8a3166bf43) |
| `dmd-2.111.0`     | DMD compiler v2.111.0 + dub + rdmd | [link](https://hub.docker.com/layers/kirillsaidov/dlang/dmd-2.111.0/images/sha256-ae7a9caf1cd7b06547261a12aaa3dd4e572ddeaa76e71d4855760d8a3166bf43) |

### LDC2
| Image Tag         | Description                         | Link       |
| ----------------- | ----------------------------------- | ---------- |
| `ldc2-latest`     | Latest LDC2 compiler + dub + rdmd   | [link](https://hub.docker.com/layers/kirillsaidov/dlang/ldc2-latest/images/sha256-bbe43bf2e2ab5ed0539ccbebfe2084c0d937f098df6cf9fe5b1bf2d20e58ddf2) |
| `ldc2-2.111.0`    | LDC2 compiler v2.111.0 + dub + rdmd | [link](https://hub.docker.com/layers/kirillsaidov/dlang/ldc2-2.111.0/images/sha256-bbe43bf2e2ab5ed0539ccbebfe2084c0d937f098df6cf9fe5b1bf2d20e58ddf2) |

## Usage Example

### Check compiler version
```sh
docker run --rm kirillsaidov/dlang:dmd-latest dmd --version
```

### Build and test your project
```sh
docker run --rm -v $PWD:/app -w /app kirillsaidov/dlang:dmd-latest dub build
docker run --rm -v $PWD:/app -w /app kirillsaidov/dlang:dmd-latest dub run
```

### Interactive environment
You can interactively use the container to build your project:
```
docker run --rm -v $PWD:/app -w /app -it kirillsaidov/dlang:dmd-latest /bin/bash
```

## LICENSE
Unlicense.