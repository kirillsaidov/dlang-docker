# D Docker Containers

<img src="https://tour.dlang.org/static/img/tour/dman.png" height="200"/>

Prebuilt Docker-based toolchains for compiling, building, and running [D language](https://dlang.org) projects. Useful as base images for CI/CD pipelines, development environments, or containerized builds.

## Available Images

All images are based on `ubuntu:24.04` and include the DMD/LDC2 compiler, `dub`, and `rdmd`, ready to use out of the box.

| Image Tag           | Description                        | Link       |
| ------------------- | ---------------------------------- | ---------- |
| `dlang.dmd:latest`  | Latest DMD compiler + dub + rdmd   | [link](to-do-link |
| `dlang.dmd:2.111.0` | DMD compiler v2.111.0 + dub + rdmd | [link](to-do-link |

## Dockerfiles

Browse the Dockerfiles [here](https://github.com/kirillsaidov/dlang-docker).

## Usage Example

### Check compiler version
```sh
docker run --rm kirillsaidov/dlang.dmd:latest dmd --version
```

### Build and test your project
```sh
docker run --rm -v $PWD:/app -w /app kirillsaidov/dlang.dmd:latest dub build
docker run --rm -v $PWD:/app -w /app kirillsaidov/dlang.dmd:latest dub run
```

### Interactive environment
You can interactively use the container to build your project:
```
docker run --rm -v $PWD:/app -w /app -it kirillsaidov/dlang.dmd:latest /bin/bash
```

## LICENSE
Unlicense.